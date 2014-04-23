class Item < ActiveRecord::Base
  has_attached_file :item_image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :item_image, :content_type => /\Aimage\/.*\Z/
end
