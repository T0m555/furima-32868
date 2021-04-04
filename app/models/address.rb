class Address < ApplicationRecord
  with_options presence: true do
    validates :post_number, :municipality, :address, :phone_number
    validates :prefecture_id, numericality: { other_than: 1 }
  end
  has_one :payment
end
