class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:login, :full_name, :birthday, :address, :city, :state, :country,:zip])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login])
  end
end