class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
# Essentially calling protect_from_forgery adds verify_authenticity_token to the before_filter list, which you can skip in the other controllers.
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?
  skip_before_filter  :verify_authenticity_token

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end


  protected

  def authenticate_user!
    redirect_to root_path unless logged_in?
  end
end
