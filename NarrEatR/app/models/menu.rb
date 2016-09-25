class Menu < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", small: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
