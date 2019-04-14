require 'net/http'

module Fhir
  class QuestionnairesController < FhirController
    RESOURCE = 'questionnaire'

    # GET /Questionnaire
    # GET /Questionnaire.json
    # GET /Questionnaire.xml
    def index
      response = get_gringotts_resources(RESOURCE)
      if response.success?
        @questionnaires = Fhir::Questionnaire.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    # GET /Questionnaire/1
    # GET /Questionnaire/1.json
    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @questionnaire = Fhir::Questionnaire.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    # POST /Questionnaire
    # POST /questionnaires.json

    def create
      response = create_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render body: nil, status: 201, location: "#{FHIR_LOCATION_ROOT}/Questionnaire/#{response.body[:id]}"
        else
          send_operation_outcome(response, 400)
        end
      else
        send_operation_outcome(nil, 503, 'Application unavailable at this time')
      end
    end

    def update
      response = update_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render body: nil, status: 200
        else
          send_operation_outcome(response, 400)
        end
      else
        send_operation_outcome(nil, 503, 'Application unavailable at this time')
      end
    end

    private
    def questionnaire_params
      params[:questionnaire]
    end
  end
end

