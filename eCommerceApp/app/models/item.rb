class Item < ApplicationRecord
  
  mount_uploader :image, ItemImageUploader
end
