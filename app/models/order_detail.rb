class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order
  
  def subtotal
    order_detail. * amount
  end


end
