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
    if SessionService.authenticate(@user, params[:password])
      # TODO Add successful log in message
      logger.debug "#{@user.email} is trying to create a session"
      root_path
    else
      logger.error "** Failure** Attempt to login as #{params[:user_name]} - rejected"
      render text: 'Login failed', status: :unauthorized
    end

  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private
  def set_user
    @user = User.find_by(email: params[:email])
  end
end
