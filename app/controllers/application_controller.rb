class ApplicationController < ActionController::Base
  # around_action :user_time_zone, if: :current_user

  def after_sign_in_path_for(resource)
    posts_index_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # add strong parameter of name when you sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    
    # add strong parameter of name when you update your account
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:timezone])
  end

  private

  # def user_time_zone(&block)
  #   Time.use_zone(current_user.timezone, &block)
  # end

  def set_time_zone
    Time.zone = current_user.timezone if current_user
  end
end
