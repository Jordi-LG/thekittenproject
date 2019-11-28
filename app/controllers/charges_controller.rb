class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

      @new_order = Order.create(user_id: current_user.id)
      @order = Order.last

      @items = all_items
      @items.each do |item|
        JoinOrderItem.create(order_id: @order.id, item_id: item.id)
      end

      if @new_order.save
        @current_email = current_user.email
        UserMailer.after_order(@current_email, @new_order).deliver_now
        UserMailer.admin_alert(current_user, @new_order).deliver_now
        destroy
        redirect_to root_path
      end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def destroy
    cu = Cart.find_by(user_id: current_user.id)
    JoinCartItem.where(cart_id: cu.id).destroy_all
  end

end
