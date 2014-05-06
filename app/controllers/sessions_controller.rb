class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create], if: json_request?

  def create
    if @user
      logger.debug "#{@user} is trying to create a session"
    else
      logger.error "Attempt to login as #{params[:user_name]}"
      render text: "Login failed", status: :unauthorized
    end
  end

  private
  def set_user
    @user = User.where(email: params[:user_name]).first
  end
end