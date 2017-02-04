module WardenAuthenticate
  extend ActiveSupport::Concern

  included do
    prepend_before_action :authenticate!
  end

  def authenticate!
    if MainStreetStation::Application.config.fhir_enforce_security
      warden.authenticate!
    else
      logger.warn '*** Authorization has been bypassed'
      true
    end
  end
end
