class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, :numericality => { :greater_than_or_equal_to => 300 }
    validates :price, :numericality => { :less_than_or_equal_to => 9999999 }
    validates :name, :description, :image
    with_options numericality: {other_than: 1} do
      validates :category_id, :condition_id, :shippingCharge_id, :prefecture_id, :daysToShip_id
    end
  end
end