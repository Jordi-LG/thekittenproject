class CartsController < ApplicationController

  def show
    @cart = current_user_cart
    @items = all_items
    @items_price = only_price_array
  end

  def update
    if current_user
      cart_exist?
      @cart = current_user_cart
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

  def destroy
    JoinCartItem.delete(selected_item_in_cart)

    redirect_to cart_path(Cart.find_by(user_id: current_user.id).id)
  end

  private
  ##########################
  #METHODES POUR UPDATE
  def cart_exist?
    if Cart.exists?(user_id: current_user.id) == false
      Cart.create(user_id: current_user.id)
    end
  end

  def current_user_cart
    Cart.find_by(user_id: current_user.id)
  end

  def current_item
    Item.find(params[:id])
  end

  ##########################
  #METHODES POUR SHOW
  def all_items
    u = current_user
    cu = Cart.find_by(user_id: u.id)
    @items = []

    JoinCartItem.where(cart_id: cu.id).each do |item|
      @items << Item.find(item.item_id)
    end

    return @items
  end

  def only_price_array
    items = all_items

    items_price = []
    items.each do |item_price|
      items_price << item_price.price
    end

    return items_price
  end

  #########################
  #METHODE DELETE
  def selected_item_in_cart
    cu = Cart.find_by(user_id: current_user.id)
    return JoinCartItem.find_by(cart_id: cu.id, item_id: params[:id])
  end

end
