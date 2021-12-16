class ApplicationController < ActionController::Base
  # pour demander le login
  before_action :authenticate_user!

  # pour first name last name permit
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname])
  end
end
