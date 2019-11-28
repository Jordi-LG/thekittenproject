class Item < ApplicationRecord
  has_many :join_cart_items
  has_many :carts, through: :join_cart_items

  has_many :join_order_items
  has_many :orders, through: :join_order_items

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    format: { with: /\A\d+(\.\d{2})?\z/ }, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000000 }
  validates :image_url, presence: true
end
