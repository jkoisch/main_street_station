# This controller is for interactive Logins
class User::OauthSessionsController < ApplicationController
# before_filter :configure_sign_in_params, only: [:create]
  before_action :set_user, only: [:create]
  # before_filter :require_no_authentication, only: [:new, :create]

  # GET /resource/sign_in
  def new
  end

  # POST /resource/sign_in
  def create
  end

  def destroy
    logger.debug "Attempting User Logout"
    SessionService.signout(current_user)
    super
  end

  protected
  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  private
  def set_user
    @user = User.find_by(email: user_params[:email])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
