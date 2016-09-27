class MenusController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: :create

  def index
    @menus = Menu.order(created_at: :desc)
  end

  def create
    #get image from params in format of "{ "menu": { "restaurant_name": "FoodTown", "raw_image": "data:image/png;base64,iVBORw0KGgo...", "image_file_name": "file.png" } }
    # menu = Menu.create( restaurant_name: "Pete's Pizza")
    # image = Paperclip.io_adapters.for(params[:rawImage])
    # image.original_filename = "stuff.png"
    # menu.image = image


    # ###TEST CODES TO AVOID PAPERCLIP && PARAMS
    # # picUrl = 'http://restaurantmenudesignstyle.com/wp-content/uploads/2016/01/example-list-of-menu-in-restaurant.new-italian-restaurant-menu-2a.jpg'
    # # image = Paperclip.io_adapters.for(picUrl)
    # # rest_name = "PIZZERIA"


    # # img = encoded_image('http://inboxtranslation.com/wp-content/uploads/2014/10/3-restaurant-translated-menu-arabic.jpg') # placeholder image for testing
    # #img = extract base64 data from params
    # # menu = Menu.create( restaurant_name: rest_name, image: image )

    # # picUrl = menu.image.url
    # if menu.save
    #   menu.ocr_text = ocr_api_call(picUrl)
    #   menu.save

    menu = Menu.create( restaurant_name: "Pete's Pizza")
    image = Paperclip.io_adapters.for(params[:rawImage])
    image.original_filename = "stuff.png"
    menu.image = image
    # rest_name = params[:menu][:restaurant_name]
    if menu.save
    p menu.image.url
    puts "image===================================================================================================="
    img = encoded_image("http:#{menu.image.url}") # placeholder image for testing
    # img = extract base64 data from params
    # menu = Menu.create( restaurant_name: "Pete's Pizza", image: image )
      uri = URI("https://vision.googleapis.com/v1/images:annotate?key=#{ENV["google_vision_key"]}")
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
          render json: menu.errors.full_messages, content_type: "application/json"
        end
        format.html do
            render file: "#{Rails.root}/public/500", layout: false, status: 500
        end
      end
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:restaurant_name, :image)
  end

end
