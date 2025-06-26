class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # These methods will be available in views as well as controllers
  helper_method :current_user, :user_signed_in?
end
