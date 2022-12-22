class Public::OrdersController < ApplicationController
  def new
    @cart_items = current_customer.cart_items
    if @cart_items == nil
        render cart_items_path
    else
    @order = Order.new
    end
  end
 

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method] 
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.total_price } 
    @order.postage = 700 
    
    ## 自分の住所
    if params[:order][:address_option] == "0"
        @order.postcode = current_customer.postcode 
        @order.address = current_customer.address 
        @order.name = current_customer.last_name + " " + current_customer.first_name 
        render "confirm"
        
    ## 登録済住所
    elsif params[:order][:address_option] == "1" 
        @delivery = Delivery.find_by(params[:order][:deliveries_id]) 
        @order.postal_code = @delivery.postal_code
        @order.address = @delivery.address
        @order.name = @delivery.name 
        render "confirm"
    
    # 新規登録
    elsif params[:order][:address_option] == "2"
        @address = current_customer.deliveries.new
        @address.postal_code = params[:order][:postal_code]
        @address.address = params[:order][:address] 
        @address.name = params[:order][:name] 
        @address.customer_id = current_customer.id 
        if @address.save
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name 
        else
            render "new"
        end
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    
    if @order.save
        @cart_items.each do |cart_item|
            order_item = OrderItem.new
            order_item.order_id = @order.id 
            order_item.item_id = cart_item.item_id
            order_item.quantity = cart_item.quantity 
            order_item.purchase_price = cart_item.item.price * 1.1
            order_item.production_status = 0
            order_item.save
        end
        
        
        @cart_items.destroy_all
        redirect_to complete_path 
    else
        render "new" 
    end
  end

  def index
  end

  def show
  end
  
  def order_detail_params
     params.require(:order_detail).permit(:price, :amount, :name, :making_status)
  end
  
end
