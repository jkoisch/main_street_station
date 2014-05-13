module Fhir
  class FhirController < FhirBaseController
    before_filter :api_or_interactive #, except: [ :index, :show_old ]

    private
    def api_or_interactive
      if json_request?
        api_authenticate_user
      else
        authenticate_user!
      end
    end


    def api_authenticate_user
      if MainStreetStation::Application.config.fhir_enforce_security
        validate_authenticity_token
      else
        logger.warn '*** Authorization has been bypassed'
        true
      end
    end

=begin
    def validate_authenticity_token
      #false # TODO: replace with actual security check
      authenticate_or_request_with_http_token do |token, options|
        db_token = UserToken.find_by(authentication_token: token)
        logger.warn "Token #{token} is invalid" if db_token.nil?
        !db_token.nil?
      end
    end
=end

    def validate_authenticity_token
      authenticate_or_request_with_http_token do |token, options|
        db_token = UserToken.find_by(authentication_token: token)
        !db_token.nil? and db_token.authentication_expiry > Time.now
      end
    end

    def json_request?
      request.format.json?
    end
  end
end
