class User::OmniauthCallbacksController < ApplicationController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  #from controllers.omniauth_callbacks_controller.rb
  #before_filter :https_redirect

  def all
    #Rails.logger.debug("#####omniauthCallbacksController current_user:")
    #raise request.env["omniauth.auth"].to_yaml
    Rails.logger.debug("current_user: #{current_user}")
    user = User.from_omniauth(request.env['omniauth.auth'], current_user)

    if user.persisted?
      flash.notice = 'Signed in!'
      sign_in_and_redirect user, event: :authentication
    else
      session['devise.user_attributes'] = user.attributes #request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :google, :all

  private

  def use_https?
    true
  end

end

