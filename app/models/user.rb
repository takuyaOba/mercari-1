class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :items
  has_one :address
  # has_many :orders

  validates :nickname, presence: true
  validates :family_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "名 に数字や特殊文字は使用できません" }, presence: true
  validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "姓 に数字や特殊文字は使用できません" }, presence: true
  validates :family_kana, format: { with: /\A[ァ-ンー－]+\Z/, message: "名カナ を入力してください" }, presence: true
  validates :first_kana, format: { with: /\A[ァ-ンー－]+\Z/, message: "姓カナ を入力してください" }, presence: true
  validates :birth_day, presence: true
  validates :birth_month, presence: true
  validates :birth_year, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }



   #userが削除されたらそれに紐づくlikeも削除したい
  has_many :likes
  has_many :likes,  dependent: :destroy
  # has_many :flags
  # has_many :like_items,through: :likes,source: :item
  # has_many :flag_items,through: :flags,source: :item
  # belongs_to :rate
  # belongs_to :payment_information
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(
      uid: auth.uid,
      provider: auth.provider,
      nickname: User.dummy_nickname(auth),
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )

    user
 end

  private

  def self.dummy_email(auth)
    if auth.provider == "facebook" # facebook時の処理
      "#{auth.uid}-#{auth.provider}@example.com"
    else
      auth.info.email.to_s
    end
  end

  def self.dummy_nickname(auth)
    auth.info.name.to_s
  end
end



# , dependent: :destory
