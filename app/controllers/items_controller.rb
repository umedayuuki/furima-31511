class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @item.purchase.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :image, :status_id, :burden_id, :category_id, :area_id,
                                 :day_id).merge(user_id: current_user.id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_redirect
    redirect_to root_path unless @item.user_id == current_user.id
  end
end
