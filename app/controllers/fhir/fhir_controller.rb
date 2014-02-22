module Fhir
  class FhirController < FhirBaseController
    before_filter :authenticate_user! #, except: [ :index, :show_old ]

    private
    def api_authenticate_user
      if MainStreetStation::Application.config.fhir_enforce_security
        validate_authenticity_token
      else
        true
      end
    end

    def validate_authenticity_token
      false # TODO: replace with actual security check

      # in testing this method needs to be mocked
    end
  end
end
