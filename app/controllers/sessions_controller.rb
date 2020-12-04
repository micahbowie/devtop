class SessionsController < ApplicationController

  def new
    dynamic_background
    if current_user
      redirect_to '/devtop', notice: "You are already Logged in!"
    end
  end

  def github_login
    username = auth_hash['info']['name']
    user = User.find_or_create_by(username: username) do |user|
      user.username = username
      user.password = SecureRandom.hex
    end
      session[:username] = user.username
      redirect_to devtop_path
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

  private
  def dynamic_background
    @backgroundimg = ["https://rb.gy/d2bjqr", "https://rb.gy/93exoq", "https://rb.gy/axbchi", "https://rb.gy/ypujiv" ].sample(1).join(', ')
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

end
