class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  # belongs_to :genre

# 画像投稿
  has_one_attached :image

  validates :name, {presence: true}
  validates :introduction, {presence: true}
  validates :price, {presence: true}
end
