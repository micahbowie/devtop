class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:username]
  end

  def logout!
    session.clear
  end

  def current_user
    User.find_by(:username => session[:username])
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to login_path
    end
  end

  
end
