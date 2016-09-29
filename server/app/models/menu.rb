class Menu < ActiveRecord::Base
  belongs_to :creator, class_name: :user
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", small: "100x100>" }
  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  size: { in: 0..10.megabytes}
  # validate :image_dimensions, on: :create

  def self.generate_random_restaurant
    restaurant_name = ["Hogwash Express", "Dumbledore's Dungeon", "Michelle's Crab Shack", "StArmbrust technical cuisine", "Alex's TacoTruck Express", "Ben's Legally Sue Foo Young", "Erica's Tupperton Heat Eatery", "Sohel's Matt Bakery"]
     restaurant_name.sample
  end

  def self.generate_image_filename
    filename = Faker::Team.creature
    "#{filename}.png"
  end



  private

  def image_dimensions
    required_width  = 1024
    required_height = 768
    dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
    errors.add(:image, "Width must be at least 1024 px") unless dimensions.width >= required_width
    errors.add(:image, "Height must be at least 768 px") unless dimensions.height >= required_height
  end
end
