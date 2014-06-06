class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :https_redirect
  def all
    user = User.from_omniauth(request.env['omniauth.auth'])

    #user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
      flash.notice = 'Signed in!'
      sign_in_and_redirect user
    else
      #DEV?
      #session["devise.user_attributes"] = user.attributes
      #PROD?
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all

  private

  def use_https?
    true
  end

end
