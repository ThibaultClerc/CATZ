class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    puts "$" * 60
    puts @item
  end
  
end
