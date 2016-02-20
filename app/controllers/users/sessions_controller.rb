# This controller is for interactive Logins
class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  before_action :set_user, only: [:create]
  before_filter :require_no_authentication, only: [:new, :create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if SessionService.authenticate(@user, user_params[:password])
      logger.debug "#{@user.email} has created a session"
      set_flash_message(:notice, :signed_in)
      sign_in(resource_name, resource)
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      logger.error "** Failure** Attempt to login as #{user_params[:email]} - rejected"
      set_flash_message(:error, :invalid, authentication_keys: 'email')
      respond_with(resource, serialize_options(resource))
    end
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
