class Item < ApplicationRecord
  # has_many :item_images
  # has_many :likes
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
  # belongs_to_active_hash :condition
  # # belongs_to_active_hash :burden
  # # belongs_to_active_hash :way
  # # belongs_to_active_hash :days
end