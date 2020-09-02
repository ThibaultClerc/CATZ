class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_current_user_profile_page?, only: [:show]

  def show
    @user = current_user
    @cart = Cart.find(params[:id])
    @total_price = 0
    @cart.items.each do |item|
      @total_price += item.price 
    end
  end

  def update
    @cart_of_user = User.find(current_user.id).cart
    @cart_of_user.items << Item.find(item_params[:item_id])
  end

  private

  def is_current_user_profile_page?
    if current_user == User.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  def item_params
    params.permit(:item_id)
  end

  def cart_params
    params.permit(:id)
  end

end
