class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(post_params)

    if @item.save
      flash[:success] = "L'article a été mis à jour avec succès !"
      redirect_to admin_items_path
    else
      flash[:error] = "Une erreur est survenue lors de la mise à jour de l'article"
      redirect_to admin_items_path
    end

  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:success] = "L'article a correctement été supprimé !"
      redirect_to admin_items_path
    else
      flash[:error] = "Erreur lors de la suppression de l'article"
      redirect_to admin_items_path
    end
    
  end

  private

  def post_params
    return params.require(:item).permit(:title, :description, :price)
  end
  
end
