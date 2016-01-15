class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permited_parameters, if: :devise_controller?
  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.for(:account_update) do |parameters|
      parameters.permit(:bio, :avatar, :name, :email, :password, :password_confirmation,
        :current_password)
    end
  end
end
