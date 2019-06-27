class Item < ApplicationRecord
  scope :display, ->(category_first){where(first_category_id:(category_first)).order("RAND()").includes(:item_images).limit(4)}
  
  has_many :item_images, foreign_key: "item_id",  dependent: :destroy

  accepts_nested_attributes_for :item_images
  validates :name, :description,:price,:first_category_id,:second_category_id, :third_category_id,:status, presence: true



  belongs_to :purchase


  has_many :likes,  dependent: :destroy
  has_many :flags
  # has_many :like_users,through: :likes, source: :user
  # has_many :flag_users,through: :flags, source: :user

  belongs_to :user,optional: true
  belongs_to :first_category, optional: true
  belongs_to :second_category,  optional: true
  belongs_to :third_category, optional: true
  belongs_to :brand,optional: true
  belongs_to :size,optional: true
  # belongs_to :order

  


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :delivery_days
end
