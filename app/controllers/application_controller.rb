class ApplicationController < ActionController::Base
  #  A method call that is used to protect against
  # Cross-Site Request Forgery (CSRF) attacks in Rails applications.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!

  # setting up a
  # callback that will call the `update_allowed_parameters` method before executing any action in the
  # controller, but only if the current controller is a `devise_controller`.
  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    # configuring the permitted parameters for the sign-up action in the Devise gem.
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }

    # configuring the permitted parameters for the account update
    # action in the Devise gem.
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
