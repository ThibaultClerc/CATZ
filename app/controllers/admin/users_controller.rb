class Admin::UsersController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(post_params)

    if @user.save
      flash[:success] = "L'utilisateur a été mis à jour avec succès !"
      redirect_to admin_users_path
    else
      flash[:error] = "Une erreur est survenue lors de la mise à jour de l'utilisateur"
      redirect_to admin_users_path
    end

  end
  
  
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = "L'utilisateur a correctement été supprimé !"
      redirect_to admin_users_path
    else
      flash[:error] = "Erreur lors de la suppression de l'utilisateur"
      redirect_to admin_users_path
    end
    
  end


  private

  def post_params
    return params.require(:user).permit(:first_name, :last_name, :email, :admin)
  end
  
  
end
