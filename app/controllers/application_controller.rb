class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def deny_access
    redirect_to root_path if current_user.nil? or current_user.meta_type != "admin"
  end
end
