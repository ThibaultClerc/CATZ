class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_current_user_profile_page?, only: [:show]

  def show
  end

  private

  def is_current_user_profile_page?
    if current_user == User.find(params[:id])
    else
      flash[:error] = "Veuillez entrer un nom et un mot de passe valide"
      redirect_to root_path, error: "Nom ou mot de passe invalide"
    end
  end
  
end
