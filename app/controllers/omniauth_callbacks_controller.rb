class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :https_redirect

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
