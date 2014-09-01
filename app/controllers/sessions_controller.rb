class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create], if: :is_json_request?

  def create
    if SessionService.authenticate(@user, params)
      logger.debug "#{@user.email} is trying to create a session"
    else
      logger.error "** Failure** Attempt to login as #{params[:user_name]} - rejected"
      render text: 'Login failed', status: :unauthorized
    end
  end

  def destroy

  end

  private
  def set_user
    @user = User.find_by(email: params[:user_name])
  end

  def is_json_request?
    request.defined? ? request.format.json? : false
  end
end