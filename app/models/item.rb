class Item < ApplicationRecord
  has_many :join_cart_items
  has_many :carts, through: :join_cart_items

  has_many :join_order_items
  has_many :orders, through: :join_order_items
end
