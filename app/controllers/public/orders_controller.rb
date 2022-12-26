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

  def confirm
     @order = Order.new(order_params)
     @cart_items = current_customer.cart_items.all
     @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
     @total_payment = @total_price + @order.shipping_cost

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "1"
         @address = Address.find(params[:order][:address_id])
         @order.postal_code = @address.postal_code
         @order.address = @address.address
         @order.name = @address.name

    elsif  params[:order][:select_address] == "2"
      address_new = current_customer.addresses.new(address_params)
     if address_new.save
     else
        render :new
     end
    end
  end


  def complete
  end

  def create
    @cart_items = current_customer.cart_items.all
    p @order = current_customer.orders.new(order_params)
    if @order.save
      #注文詳細に保存
      @cart_items.each do |cart|
      order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.add_tax_price
        order_detail.making_status = 0
        order_detail.save
      end
      #カート内商品を空にする
      current_customer.cart_items.destroy_all
      redirect_to public_complete_path
    else
      @order = Order.new(order_params)
      render 'new'
    end

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  private
  def order_params
     params.require(:order).permit(:name, :address, :postal_code, :total_payment, :payment_method, :shipping_cost)
  end

  def order_detail_params
     params.require(:order_detail).permit(:price, :amount, :name, :making_status)
  end
end