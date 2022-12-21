class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to admin_item_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edi
  end

  def update

  end

    private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active )
  end
end
