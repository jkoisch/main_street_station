module WardenAuthenticate
  extend ActiveSupport::Concern

  included do
    prepend_before_action :authenticate!
  end

  def authenticate!
    if MainStreetStation::Application.config.fhir_enforce_security
      if json_request? || xml_request?
        warden.authenticate! scope: :api
      else
        warden.authenticate! scope: :interactive
      end
    else
      logger.warn '*** Authorization has been bypassed'
      true
    end
  end
end
