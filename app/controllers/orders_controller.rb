class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @new_order = Order.create(user_id: current_user.id)
    @order = last_order

    @items = all_items
    @items.each do |item|
      JoinOrderItem.create(order_id: @order.id, item_id: item.id)
    end

    if @new_order.save
      destroy
      redirect_to root_path
    end
  end

  def destroy
    cu = Cart.find_by(user_id: current_user.id)
    JoinCartItem.where(cart_id: cu.id).destroy_all
  end

private
  def last_order
    Order.last
  end

end
