class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
    @items = all_items
  end


  private

  def all_items
    u = current_user
    cu = Cart.find_by(user_id: u.id)
    @items = []

    JoinCartItem.where(cart_id: cu.id).each do |item|
      @items << Item.find(item.item_id)
    end
    return @items
  end

end
