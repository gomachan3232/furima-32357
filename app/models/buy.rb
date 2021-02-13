class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  
  validate :item_id
  validate :user_id
end
