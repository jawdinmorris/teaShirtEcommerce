class Item < ApplicationRecord
  belongs_to :order
  mount_uploader :image, ItemImageUploader
end
