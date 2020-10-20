class UsersController < ApplicationController

  def new
    @user = User.new
    # render :text => 'hello world'
  end

  def create
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
      session[:id] = @user.id
      redirect_to dashbaords_path
    else
      render :new
    end
  end

end
