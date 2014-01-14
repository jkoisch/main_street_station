module Fhir
  class ConformanceController < FhirBaseController
    RESOURCE = 'conformance'

    def index
      response = get_gringotts_resources(RESOURCE)
      if response.successful?
        json_data = JSON.parse(response.body, opts={:symbolize_names => true})
        @conformances = Fhir::Conformance.init_from_ember(json_data)

        respond_to do |format|
          format.html
          format.atom
          format.json
          format.xml
        end
      else
        logger.warn response
        respond_to do |format|
          format.html status: 500
          format.json status: 500
          format.xml  status: 500
        end
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      @conformance = Fhir::Conformance.parse_ehmbr(response.body)
    end

    private
    def use_https?
      false
    end
  end
end
