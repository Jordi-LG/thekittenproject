module CartsHelper
  def all_items
    u = current_or_guest_user
    cu = Cart.find_by(user_id: u.id)
    @items = []

    JoinCartItem.where(cart_id: cu.id).each do |item|
      @items << Item.find(item.item_id)
    end

    return @items
  end

  def cart_quantity_item_array
    cu = Cart.find_by(user_id: current_or_guest_user.id)
    join_cart = JoinCartItem.where(cart_id: cu.id)

    @quantity_array = []

    join_cart.each do |join|
      @quantity_array << join.quantity
    end

    return @quantity_array
  end

  def select_item_quantity(arg)
    JoinCartItem.find_by(cart_id: @cart.id, item_id: arg.id)
  end
end
