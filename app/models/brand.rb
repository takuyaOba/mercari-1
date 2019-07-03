class Brand < ApplicationRecord
  has_many :items
  has_many :first_categories

  #index（スコープ設定.brand）
  scope :brand, ->(brand_name){where(name:(brand_name)).order(created_at: :DESC).limit(4)}

    # ,through: :brand_categories
  # has_many :brand_categories
end
