class AddQuantityJoin < ActiveRecord::Migration[5.2]
  def change
    add_column :join_cart_items, :quantity, :integer
  end
end
