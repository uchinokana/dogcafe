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
  
  def comfirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.name = current_customer.full_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:address_number] == "2"
      if Address.exists?(params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
        @order.postal_code = Address.find(params[:order][:registered]).postal_code
      else
        render :new
      end
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
