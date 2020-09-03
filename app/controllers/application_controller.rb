class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
  end

  def is_admin?
    if user_signed_in? && current_user.admin == true
      return true
    else
      flash[:error] = "Vous n'êtes pas autorisé à effectuer cette action"
      redirect_to root_path
    end
  end
end
