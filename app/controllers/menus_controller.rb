class MenusController < ApplicationController
  def index
    @menus = Menu.order(created_at: :desc)
  end

  def create
    #get image from params
    img = encoded_image('http://inboxtranslation.com/wp-content/uploads/2014/10/3-restaurant-translated-menu-arabic.jpg') # placeholder image for testing
    menu = Menu.new( menu_params )
    if menu.save
      uri = URI("https://vision.googleapis.com/v1/images:annotate?key=#{Figaro.env.google_vision_key}")
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
      end
      #send text back to client-side
    else

  end

  private
  def encoded_image(image_url)
    @encoded_image ||= Base64.encode64 open(URI.parse(image_url)).read
  end

  def menu_params
    params.require(:menu).permit(:restaurant_name, :image)
  end

end
