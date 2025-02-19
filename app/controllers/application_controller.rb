class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user = User.find_by(id: session[:user_id]) || User.new
  end

  def logged_in?
    !!current_user.id
  end

  def require_logged_in
    redirect_to new_session_path unless logged_in
  end

end
