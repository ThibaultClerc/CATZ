class Admin::OrdersController < ApplicationController
  before_action :is_admin?

  def index
    @orders = Order.all
  end


  def destroy
    @order = Order.find(params[:id])

    if @order.destroy
      flash[:success] = "La commande a correctement été supprimée !"
      redirect_to admin_orders_path
    else
      flash[:error] = "Erreur lors de la suppression de la commande"
      redirect_to admin_orders_path
    end
    
  end
  
end
