class SessionsController < ApplicationController

  def new
    if session[:username]
      redirect_to '/devtop', notice: "You are already Logged in!"
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:username] = user.username
      redirect_to devtop_path
    else
      redirect_to login_path, notice: "Please try again. Your Login was not successful."
    end
    # raise "it worked".inspect
  end

  def logout
    session.clear
    redirect_to login_path
  end

  def error

  end

end
