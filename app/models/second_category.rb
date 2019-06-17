class SecondCategory < ApplicationRecord
  has_many :third_categories
  has_many :users
  belongs_to :first_category
  belongs_to :size_category
  belongs_to :item
end
