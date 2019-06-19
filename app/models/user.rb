class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :orders

   #userが削除されたらそれに紐づくlikeも削除したい
  has_many :likes
  # has_many :flags
  # has_many :like_items,through: :likes,source: :item
  # has_many :flag_items,through: :flags,source: :item
  # belongs_to :rate
  # belongs_to :payment_information
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end



# , dependent: :destory
