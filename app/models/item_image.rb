class ItemImage < ApplicationRecord

  belongs_to :item
  validates :item_images, presence: true
  

end