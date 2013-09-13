class ApplicationController < ActionController::Base
  before_filter :authenticate_user! #, except: [ :index, :show ]
  protect_from_forgery

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
        if resource.is_a?(User)
          flash[:notice] = "user logged in native"
          trust_authentication_path(User)
        else
          super
        end
  end
end
