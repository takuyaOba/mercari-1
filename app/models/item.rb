class Item < ApplicationRecord
  scope :display, ->(category_first){where(first_category_id:(category_first)).order("RAND()").includes(:item_images).limit(4)}
  has_many :item_images


  #  accepts_nested_attributes_for


  # has_many :likes
  has_many :likes

  # has_many :flags
  # has_many :like_users,through: :likes, source: :user
  # has_many :flag_users,through: :flags, source: :user
  # belongs_to :order
  belongs_to :user
  belongs_to :first_category
  belongs_to :second_category
  belongs_to :third_category
  belongs_to :brand
  belongs_to :size
  # belongs_to :rate,dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :way
  belongs_to_active_hash :days
end



