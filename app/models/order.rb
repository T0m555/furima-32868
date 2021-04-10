class Order
  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id

  #address
  with_options presence: true do
    validates :municipality, :address, :item_id, :user_id, :token
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :post_number, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    payment = Payment.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, payment_id: payment[:id])
  end

end