require 'net/http'

module Fhir
  class ObservationsController < FhirController
    RESOURCE = 'observation'

    def index
      response = get_gringotts_resources(RESOURCE)
      if response.success?
        @observations = Fhir::Observation.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @observation = Fhir::Observation.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end
  end
end
