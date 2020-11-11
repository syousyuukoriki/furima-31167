class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :item_condition_id, :price, :shipping_cost_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
