class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:update] 

  def show
    @cart = current_user_cart
    @items = all_items
    @items_price = only_price_array
    @quantity_array = cart_quantity_item_array
  end

  def update
    @cart = current_user_cart
    @item = current_item
    @select = selected_item_in_cart

    item = JoinCartItem.find_by(cart_id: @cart.id, item_id: @item.id)

    if item
      item.quantity = ((item.quantity) + 1)
      item.save
      flash[:succes] = "Ajouté au panier"
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js { }
        end
    else
      JoinCartItem.create(cart_id: @cart.id, item_id: @item.id, quantity: 1)
      flash[:succes] = "Ajouté au panier"
        respond_to do |format|
          format.html { redirect_to root_path }
          format.js { }
        end
    end
  end

  def appel(arg)
    return JoinCartItem.find_by(cart_id: current_or_guest_user.id, item_id: arg.id)
  end

  def destroy
    JoinCartItem.delete(selected_item_in_cart)

    redirect_to cart_path(Cart.find_by(user_id: current_or_guest_user.id).id)
  end

  private
  ##########################
  #METHODES POUR UPDATE

  def current_user_cart
    Cart.find_by(user_id: current_or_guest_user.id)
  end

  def current_item
    Item.find(params[:id])
  end

  ##########################
  #METHODES POUR SHOW

  def only_price_array
    items = all_items
    quantities = cart_quantity_item_array

    items_price = []
    items.each_with_index do |item_price, index|
      items_price << (item_price.price) * quantities[index]
    end

    return items_price
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

  #########################
  #METHODE DELETE
  def selected_item_in_cart
    cu = Cart.find_by(user_id: current_or_guest_user.id)
    return JoinCartItem.find_by(cart_id: cu.id, item_id: params[:id])
  end

end
