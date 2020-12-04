class DashboardsController < ApplicationController
before_action :redirect_if_not_logged_in

  def index
    @user = current_user
  end

  def gosearch
    search = params[:search]
    go_google = search.split(' ').join('+')
    redirect_to 'https://www.google.com/search?q=' + go_google
  end

end
