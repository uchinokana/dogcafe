class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @quantity = Item.count
    
  end

  def show
  end
  
  # private
  # def item_params
  #   params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active )
  # end
end
