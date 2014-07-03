module Fhir
  class ConformanceController < FhirBaseController
    RESOURCE = 'conformance'

    def index
      response = get_gringotts_resources(RESOURCE)
      if response.success?
        @conformances = Fhir::Conformance.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def show
      the_id = params.has_key?(:id) ? params[:id] : 1
      response = get_resource(RESOURCE, the_id)
      @conformance = Fhir::Conformance.parse_ehmbr(response.body)
    end

    private
    def use_https?
      false
    end
  end
end
