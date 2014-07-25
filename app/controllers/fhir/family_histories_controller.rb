require 'net/http'

module Fhir
  class FamilyHistoriesController < FhirController
    RESOURCE = 'family_history'

    # GET /FamilyHistory
    # GET /FamilyHistory.json
    # GET /FamilyHistory.xml
    def index
      response = get_gringotts_resources(RESOURCE)
      if response.success?
        @family_histories = Fhir::FamilyHistory.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    # GET /FamilyHistory/1
    # GET /FamilyHistory/1.json
    # GET /FamilyHistory/1.xml
    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @family_history = Fhir::FamilyHistory.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    # POST /FamilyHistory
    # POST /FamilyHistory.json
    # POST /FamilyHistory.xml

    def create
      response = create_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render nothing: true, status: 201, location: "#{FHIR_LOCATION_ROOT}/FamilyHistory/#{response.body[:id]}"
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

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_history_params
      params[:family_history]
    end
  end
end

