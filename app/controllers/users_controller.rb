class UsersController < ApplicationController
before_action :redirect_already_logged_in, only: [:new]
before_action :dynamic_background, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:username] = @user.username
      redirect_to :devtop
    else
      redirect_to :root
    end
  end


private

  def dynamic_background
    @backgroundimg = ["https://rb.gy/d2bjqr", "https://rb.gy/93exoq", "https://rb.gy/axbchi", "https://rb.gy/ypujiv" ].sample(1).join(', ')
  end

  def user_params
    params.permit(:username, :password)
  end
end
