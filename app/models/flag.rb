class Flag < ApplicationRecord
  belongs_to :item,dependent: :destroy
  belongs_to :user,dependent: :destroy
end
