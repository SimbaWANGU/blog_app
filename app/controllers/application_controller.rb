class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def logging_out; end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
