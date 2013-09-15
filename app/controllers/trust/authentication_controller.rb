class Trust::AuthenticationController < ApplicationController
  before_filter :authenticate_user! , except: [:index]  #, :show]

  def index
    @title = "Home Authentication Index"
  end

  def show
    @title = "This is the show authentication"
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to trust_root_path
  end

  private

  def use_https?
    false
  end

end
