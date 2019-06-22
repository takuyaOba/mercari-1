class Address < ApplicationRecord
  belongs_to :user

  validates :zip_code, format: { with: /\A\d{7}\Z/ }, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone, format: { with: /\A\d{10}\Z|\A\d{11}\Z/ }, presence: true
end
