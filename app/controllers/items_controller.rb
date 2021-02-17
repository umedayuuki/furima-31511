class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
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

  def item_params
    params.require(:item).permit(:item_name, :price, :description, :image, :states_id, :bueden_id, :category_id, :area_id,
                                 :day_id).merge(user_id: current_user.id)
  end
end
