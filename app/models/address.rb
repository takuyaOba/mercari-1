class Address < ApplicationRecord
  belongs_to :user

  validates :sender_family_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "名 に数字や特殊文字は使用できません" }, presence: true
  validates :sender_first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "姓 に数字や特殊文字は使用できません" }, presence: true
  validates :sender_family_kana, format: { with: /\A[ァ-ンー－]+\Z/, message: "名カナ を入力してください" }, presence: true
  validates :sender_first_kana, format: { with: /\A[ァ-ンー－]+\Z/, message: "姓カナ を入力してください" }, presence: true
  validates :zip_code, format: { with: /\A\d{7}\Z/ }, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone, format: { with: /\A\d{10}\Z|\A\d{11}\Z/ }, presence: true
end
