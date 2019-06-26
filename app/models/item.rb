class Item < ApplicationRecord
  scope :display, ->(category_first){where(first_category_id:(category_first)).order("RAND()").includes(:item_images).limit(4)}


  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  validates :price, presence: true
  validates :name, :description, :first_category_id,:second_category_id, :third_category_id, presence: true






  has_many :likes,  dependent: :destroy
  # has_many :flags
  # has_many :like_users,through: :likes, source: :user
  # has_many :flag_users,through: :flags, source: :user


  belongs_to :user,optional: true
  belongs_to :first_category,  dependent: :destroy,optional: true
  belongs_to :second_category,  dependent: :destroy,optional: true
  belongs_to :third_category,  dependent: :destroy,optional: true
  belongs_to :brand,optional: true
  belongs_to :size,optional: true
  # belongs_to :order

  # belongs_to :rate,dependent: :destroy


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :way
  belongs_to_active_hash :days
end
