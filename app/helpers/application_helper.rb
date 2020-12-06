module ApplicationHelper

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

  def redirect_already_logged_in
    if current_user
      redirect_to '/devtop', notice: "You are already Logged in!"
    end
  end


end
