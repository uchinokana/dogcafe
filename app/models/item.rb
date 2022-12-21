class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details



  validates :name, {presence: true}
  validates :introduction, {presence: true}
  validates :price, {presence: true}
end
