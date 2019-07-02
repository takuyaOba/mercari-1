class ThirdCategory < ApplicationRecord

  scope :genre, ->(category){where(second_category_id:(category))}

  belongs_to :second_category
  belongs_to :item
end
