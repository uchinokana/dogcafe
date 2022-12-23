class Public::OrdersController < ApplicationController
  def new
    @delivery = current_customer
    @cart_items = current_customer.cart_items
    if @cart_items == nil
        render cart_items_path
    else
    @order = Order.new
    end
  end


  def complete
  end

  def create

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def order_detail_params
     params.require(:order_detail).permit(:price, :amount, :name, :making_status)
  end

end
