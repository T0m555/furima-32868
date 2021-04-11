class Item < ApplicationRecord
  belongs_to :user
  has_one :payment
  has_one_attached :image
  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :name, :description, :image
    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id
    end
  end
end
