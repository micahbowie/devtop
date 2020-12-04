class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :info, :error, :warning

  def logged_in?
    !!current_user
  end

  def logout!
    session.clear
  end

  def current_user
    @current_user ||= User.find_by(:username => session[:username]) if session[:username]
  end

  def redirect_if_not_logged_in
    redirect_to :root unless logged_in?
  end
end
