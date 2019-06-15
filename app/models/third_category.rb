class ThirdCategory < ApplicationRecord
  belongs_to :second_category
  belongs_to :item
end
