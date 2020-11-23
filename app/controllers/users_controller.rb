class UsersController < ApplicationController

  def new
    @user = User.new
    dynamic_background
    # render :text => 'hello world's
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
      session[:id] = @user.id
      redirect_to devtop_path
    else
      render :new
    end
  end


private

def dynamic_background
  @backgroundimg = ["https://rb.gy/d2bjqr", "https://rb.gy/93exoq", "https://rb.gy/axbchi", "https://rb.gy/ypujiv" ].sample(1).join(', ')
end
end
