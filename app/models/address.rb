class Address < ApplicationRecord
  with_options presence: true do
    validates :municipality, :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :post_number, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
  end
  has_one :payment
end
