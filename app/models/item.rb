class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre, optional: true

# 画像投稿
  has_one_attached :image

  validates :name, {presence: true}
  validates :introduction, {presence: true}
  validates :price, {presence: true}
  
  def add_tax_price
    (self.price * 1.1).round
  end
  
end
