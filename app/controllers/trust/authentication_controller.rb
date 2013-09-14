class Trust::AuthenticationController < ApplicationController
  before_filter :authenticate_user! , except: [:index]  #, :show]

  def index
    @title = "Home Index"
  end

  def show
    @title = "This is the show authenticaton"
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
