class OrdersController < ApplicationController
  def index
    item_set
  end

  def create
    item_set
    @payment = Payment.new(payment_params)
    @address = Address.new(address_params)
    if @payment.valid? && @address.valid?
      pay_item
      @payment.save
      @address.save

      redirect_to root_path
    else
      render item_orders_path
    end
  end

  private

  def item_set
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.permit(:post_number, :prefecture_id, :municipality, :address, :phone_number, :building_name).merge(payment_id: @payment[:id])
  end

  def payment_params
    params.permit(:item_id).merge(user_id: current_user[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
