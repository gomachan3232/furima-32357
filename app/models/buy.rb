class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy

  validate :item_id
  validate :user_id
end
