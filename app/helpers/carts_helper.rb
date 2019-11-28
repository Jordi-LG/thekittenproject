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
end
