class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def update
    if current_user
      cart_exist?
      @cart = current_user_card
      @item = current_item

      if JoinCartItem.exists?(item_id: @item.id, cart_id: @cart.id) == false
        JoinCartItem.create(cart_id: @cart.id, item_id: @item.id)

        flash[:succes] = "Ajouté au panier"
        redirect_to(item_path(@item))

      else
        flash[:alerte] = "Déjà dans le panier"
        redirect_to(item_path(@item))
      end

    else
      redirect_to new_user_session_path
    end
  end

  private
  def cart_exist?
    if Cart.exists?(user_id: current_user.id) == false
      Cart.create(user_id: current_user.id)
    end
  end

  def current_user_card
    Cart.find_by(user_id: current_user.id)
  end

  def current_item
    Item.find(params[:id])
  end
end
