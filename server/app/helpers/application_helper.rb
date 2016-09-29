module ApplicationHelper
	def ocr_api_call(picUrl)
		img = encoded_image("http:#{picUrl}")
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
      json = JSON.parse(resp.body)
      if json && json["responses"] && json["responses"][0]["textAnnotations"] && json["responses"][0]["textAnnotations"][0]["description"]
        detected_text = json["responses"][0]["textAnnotations"][0]["description"]
      end
    end
    return detected_text
  end

  def generate_random_restaurant()
    restaurant_name = ["Hogwash Express", "Dumblehore's Dungeon", "Michelle's Crap Shack", "StArmbrust technical cuisine", "Alex's TacoTruck Express", "Ben's Legally Sue Foo Young", "Erica's Tupperton Heat Eatery", "Sohel's Matt Bakery", "2Fangs Stephen's Sweet Shop"]
     return restaurant_name.sample
  end

  def generate_image_filename()
    filename = Faker::Team.creature
    return "#{filename}.png"
  end



  private

  def encoded_image(image_url)
    @encoded_image ||= Base64.encode64 open(URI.parse(image_url)).read
  end
end
