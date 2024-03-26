class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?
protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_name,:first_name, :last_name, :email,:gender, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:profile_image, :current_password, :first_name, :last_name, :password, :email, :user_name, :password_confirmation, :bio, :private)} 
    end
end
