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
          render nothing: true, status: 201, location: "#{FHIR_LOCATION_ROOT}/Questionnaire/#{response.body[:id]}"
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
    def questionnaire_params
      params[:questionnaire]
    end
  end
end

