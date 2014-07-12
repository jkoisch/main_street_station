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

    def create
      response = create_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render nothing: true, status: 201, location: "#{FHIR_LOCATION_ROOT}/Observation/#{response.body[:id]}"
        else
          render text: 'nothing', status: 400
        end
      else
        render text: 'Please try again later', status: 503
      end
    end

    def update
      response = update_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render nothing: true, status: 200
        else
          render text: 'nothing', status: 400
        end
      else
        render text: 'Please try again later', status: 503
      end
    end
  end
end
