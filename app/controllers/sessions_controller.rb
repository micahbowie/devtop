class SessionsController < ApplicationController

  def new
    if session[:id]
      redirect_to '/notes', :notice => "Already logged in!"
    end
  end

  def create
    login(params[:username], params[:password])
    redirect_to(notes_path) and return
    # raise "it worked".inspect
  end

  def logout
    session.clear
    redirect_to login_path
  end

  private

  def login(username, password)
    @user = User.find_by(:username => username)

    if @user && @user.authenticate(password)
      session[:id] = @user.id
      # raise "kinda worked".inspect
    else
      render 'new'
    end
  end

end
