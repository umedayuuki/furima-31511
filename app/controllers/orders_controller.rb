class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_redirect
  before_action :set2_redirect

  def index
    @order = PurchaseShippingAddress.new
  end

  def create
    @order = PurchaseShippingAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to items_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:purchase_shipping_address).permit(:postalcode, :area_id, :munitipalities, :address, :phonenumber, :building_name, :category_id,).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_redirect
    redirect_to root_path if @item.user_id == current_user.id
  end

  def set2_redirect
    redirect_to root_path if @item.purchase.present?
  end
end

