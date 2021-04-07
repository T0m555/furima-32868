class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user
  before_action :item_check

  def index
    item_set
    @address = Address.new()
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
      render :index
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
        amount: @item[:price],
        card: params[:token],
        currency: 'jpy'
      )
  end

  def ensure_user
    @items = current_user.items
    @item = @items.find_by(id: params[:item_id])
    redirect_to root_path unless @item.nil?
  end

  def item_check
    @payments = Payment.all
    @payment = @payments.find_by(item_id: params[:item_id])
    redirect_to root_path unless @payment.nil?
  end

end
