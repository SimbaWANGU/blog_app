class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages
<<<<<<< HEAD

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def logging_out; end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }

=======
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def logging_out; end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
>>>>>>> 068c59cc5fc4d3ce534dcfbc331bf2b47809667b
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end