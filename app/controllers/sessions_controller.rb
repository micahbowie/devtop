class SessionsController < ApplicationController

  def new
    if session[:id]
      redirect_to '/notes', :notice => "Already logged in!"
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:username] = user.username
      redirect_to dashboard_path
    else
      redirect_to login_path
    end
    # raise "it worked".inspect
  end

  def logout
    session.clear
    redirect_to login_path
  end


end
