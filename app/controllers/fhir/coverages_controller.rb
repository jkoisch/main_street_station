require 'net/http'

module Fhir
  class CoveragesController < FhirController
    RESOURCE = 'coverage'

    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      Rails.logger.debug("response.body: #{response.body}")
      if response.success?
        @coverages = Fhir::Coverage.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @coverage = Fhir::Coverage.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    private

    def build_search_params(params)
      supported_params = { subscriber:  Fhir::ReferenceParameter }

      populate_search_parameters(supported_params, params)
    end
  end
end