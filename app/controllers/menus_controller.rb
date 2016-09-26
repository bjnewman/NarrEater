class MenusController < ApplicationController
  def index
    @menus = Menu.order(created_at: :desc)
  end

  def create
    #get image from params in format of "{ "menu": { "restaurant_name": "FoodTown", "raw_image": "data:image/png;base64,iVBORw0KGgo...", "image_file_name": "file.png" } }
    image = Paperclip.io_adapters.for(params[:menu][:raw_image])
    rest_name = params[:menu][:restaurant_name]
    # img = encoded_image('http://inboxtranslation.com/wp-content/uploads/2014/10/3-restaurant-translated-menu-arabic.jpg') # placeholder image for testing
    #img = extract base64 data from params
    menu = Menu.create( restaurant_name: rest_name, image: image )
    if menu.save
      uri = URI("https://vision.googleapis.com/v1/images:annotate?key=#{ENV[google_vision_key]}")
      req = Net::HTTP::Post.new(uri, initheader = { 'Content-Type' =>'application/json' })

      req.body = {
                requests: [
                  {
                      image: {
                        content: img
                      },
                      features: {
                        type: "TEXT_DETECTION",
                        maxResults: 1
                      }
                    }
                ]
              }.to_json
      res = Net::HTTP.new(uri.host, uri.port)
      res.use_ssl = true
      detected_text = ""
      res.start do |http|
          resp = http.request(req)
          puts resp
          json = JSON.parse(resp.body)
          puts json
          if json && json["responses"] && json["responses"][0]["textAnnotations"] && json["responses"][0]["textAnnotations"][0]["description"]
          detected_text = json["responses"][0]["textAnnotations"][0]["description"]
          end
          menu.ocr_text = detected_text
          menu.save
      end
      respond_to do |format|
        format.js do
          render json: menu.ocr_text, content_type: 'application/json'
        end
        format.html do
          render file: "#{Rails.root}/public/500", layout: false, status: 500
        end
      end
    else
      respond_to do |format|
        format.js do
          render json: menu.error.full_messages, content_type: "application/json"
        end
        format.html do
            render file: "#{Rails.root}/public/500", layout: false, status: 500
        end
      end
    end
  end

  private
  def encoded_image(image_url)
    @encoded_image ||= Base64.encode64 open(URI.parse(image_url)).read
  end

  def menu_params
    params.require(:menu).permit(:restaurant_name, :image)
  end

end
