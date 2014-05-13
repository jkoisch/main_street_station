class ApplicationController < ActionController::Base
  #before_filter :https_redirect, except: [:index]
  protect_from_forgery

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||  if resource.is_a?(User)
                                        (flash[:notice] = "user logged in native")
                                        (new_user_session_url = root_url)
                                        #trust_authentication_path(User)
                                      else
                                        super
                                      end
  end

  def after_sign_out_path_for(resource_or_scope)
    trust_authentication_path(User)
  end

  def https_redirect
    if ENV['ENABLE_HTTPS'] == "yes"
      if request.ssl? && !use_https? || !request.ssl? && use_https?
        protocol = request.ssl? ? 'http' : "https"
        flash.keep
        redirect_to protocol: "#{protocol}://", status: :moved_permanently
      end
    end
  end

  def use_https?
    false  #override in other controllers
  end

end
