class Trust::AuthenticationController < ApplicationController
  before_filter :authenticate_user! #, except: [:index, :show]

  def index
    @title = "Here's the authentication index"
  end

  def show
    @title = "This is the show authenticaton"
    #@user = User.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

end
