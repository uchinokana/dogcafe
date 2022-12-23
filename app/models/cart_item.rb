class CartItem < ApplicationRecord

  belongs_to :customers
  belongs_to :admins

end
