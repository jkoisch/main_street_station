
require 'net/http'

module Fhir
  class QuestionnairesController < FhirController
    RESOURCE = 'questionnaire'

    # GET /questionnaires
    # GET /questionnaires.json
    def index
      response = get_gringotts_resources(RESOURCE)
      if response.success?
        @questionnaires = Fhir::Questionnaire.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    # GET /questionnaires/1
    # GET /questionnaires/1.json
    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @questionnaire = Fhir::Questionnaire.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    # POST /questionnaires
    # POST /questionnaires.json
    def create
      #@questionnaire = Questionnaire.new(questionnaire_params)
      #
      #respond_to do |format|
      #  if @questionnaire.save
      #    format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
      #    format.json { render action: 'show', status: :created, location: @questionnaire }
      #  else
      #    format.html { render action: 'new' }
      #    format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      #  end
      #end
      render status: 501
    end

    private
    def questionnaire_params
      params[:questionnaire]
    end
  end
end

