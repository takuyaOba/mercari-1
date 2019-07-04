class Brand < ApplicationRecord
  has_many :items
  has_many :first_categories

  #index（スコープ設定.brand）
  scope :display, ->(brand_name){where(name:(brand_name)).order(created_at: :DESC).limit(4)}
end
