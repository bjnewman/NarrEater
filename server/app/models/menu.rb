class Menu < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", small: "100x100>" }
  validates_attachment :image, presence: true,
  validate :image_dimensions
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  size: { in: 0..10.megabytes}


  private

  def image_dimensions
    required_width  = 1024
    required_height = 768
    dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)

    errors.add(:image, "Width must be #{width}px") unless dimensions.width >= required_width
    errors.add(:image, "Height must be #{height}px") unless dimensions.height >= required_height
  end
end