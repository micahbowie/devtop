class DashboardsController < ApplicationController

  def index
    redirect_if_not_logged_in
    @user = current_user
  end


end
