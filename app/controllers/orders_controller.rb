class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
  end

  def create
    @amount = order_params[:total_price].to_i*100 # amount in cents
    @cart = Cart.find(order_params[:cart_id])

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

    @order = Order.new(
      user_id: current_user.id,
      quantity: @cart.items.count,
      price: order_params[:total_price]
    )
    if @order.save
      @order.items << @cart.items
      @cart.join_table_item_carts.destroy_all
      redirect_to root_path
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to orders_path
    end

    private

    def order_params
      params.permit(:cart_id, :total_price)
    end
end
