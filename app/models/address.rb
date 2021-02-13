class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :buy

  with_options presence: true do
    validates :post_code
    validates :prefecture_id , numericality: { other_than: 1 }
    validates :city 
    validates :address
    validates :phone_number
  end
  validate :building
  
  
end
