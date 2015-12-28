require 'net/http'

module Fhir
  class CoveragesController < FhirController
    RESOURCE = 'coverage'

    def index
      response = get_gringotts_resources(RESOURCE)
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
  end
end