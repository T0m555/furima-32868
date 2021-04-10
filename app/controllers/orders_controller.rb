class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user
  before_action :item_check
  before_action :item_set, only:  [:index, :create]

  before_action :shippingCharges_set, only: [:index, :create]
  before_action :prefectures_set, only: [:index, :create]


  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_number, :prefecture_id, :municipality, :address, :phone_number, :building_name).merge(item_id: @item[:id], user_id: current_user[:id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: params[:token],
        currency: 'jpy'
      )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def ensure_user
    @items = current_user.items
    @item = @items.find_by(id: params[:item_id])
    redirect_to root_path unless @item.nil?
  end

  def item_check
    payments_set
    @payment = @payments.find_by(item_id: params[:item_id])
    redirect_to root_path unless @payment.nil?
  end

  def payments_set
    @payments = Payment.all
  end

  def shippingCharges_set
    @shippingCharges = ShippingCharge.all
  end

  def prefectures_set
    @prefectures = Prefecture.all
  end

end
