class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details

  has_one_attached :image

  validates :name, {presence: true}
  validates :description, {presence: true}
  validates :price_without_tax, {presence: true}
end
