class ItemImage < ApplicationRecord

  belongs_to :item, optional: true
  # validates :item_images, presence: true
  
end