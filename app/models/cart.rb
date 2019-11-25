class Cart < ApplicationRecord
  has_one :user

  has_many :join_cart_items
  has_many :items, through: :join_cart_items

end
