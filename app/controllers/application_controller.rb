class ApplicationController < ActionController::Base
  #before_filter :https_redirect, except: [:index]
  protect_from_forgery

  #def current_user
  #  current_user ||= User.find_by(id: session[:user_id])
  #end
  #
  #def signed_in?
  #  !!current_user
  #end
  #helper_method :current_user, :signed_in?
  #
  #def current_user=(user)
  #  current_user = user
  #  session[:user_id] = user.nil? ? nil : user.id
  #end

  def https_redirect
    if ENV['ENABLE_HTTPS'] == 'yes'
      if request.ssl? && !use_https? || !request.ssl? && use_https?
        protocol = request.ssl? ? 'http' : 'https'
        flash.keep
        redirect_to protocol: "#{protocol}://", status: :moved_permanently
      end
    end
  end

  def use_https?
    false  #override in other controllers
  end

  def json_request?
    request.format.json?
  end

  def xml_request?
    request.format.xml?
  end

  protected

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  #def after_sign_in_path_for(resource)
  #  stored_location_for(resource) ||  if resource.is_a?(User)
  #                                      (flash[:notice] = 'user logged in native')
  #                                      #(new_user_session_url = root_url)
  #                                      #trust_authentication_path(User)
  #                                    else
  #                                      super
  #                                    end
  #end
  #
  #def after_sign_out_path_for(resource_or_scope)
  #  @resource_or_scope = resource_or_scope
  #  trust_authentication_path(User)
  #end

end
