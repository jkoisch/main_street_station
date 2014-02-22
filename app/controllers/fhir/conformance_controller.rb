module Fhir
  class ConformanceController < FhirBaseController
    RESOURCE = 'conformance'

    def index
      response = get_gringotts_resources(RESOURCE)
      if response.success?
        @conformances = Fhir::Conformance.parse_ehmbr_list(response.body)

        respond_to do |format|
          #format.html
          #format.atom
          format.json
          #format.xml
        end
      else
        logger.warn response
        render text: "Failure", status: 500
      end
    end

    def show
      response = get_resource(RESOURCE, 0)
      @conformance = Fhir::Conformance.parse_ehmbr(response.body)
    end

    private
    def use_https?
      false
    end
  end
end
