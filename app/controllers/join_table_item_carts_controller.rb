class JoinTableItemCartsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @item = Cart.find(params[:cart_id]).items.find(params[:item_id]).join_table_item_carts.find_by(cart_id: params[:cart_id])
    @item.destroy
    redirect_to cart_path(params[:cart_id])
  end

  def create
    @JoinTableItemCart = JoinTableItemCart.find(params[:id])
    @JoinTableItemCart.quantity = 1
  end
end
