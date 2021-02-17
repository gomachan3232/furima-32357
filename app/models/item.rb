class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :send_day
  belongs_to :user, optional: true
  has_one :buy, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :send_day_id
  end
  validates :price, numericality: true
end
