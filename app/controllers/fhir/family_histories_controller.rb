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
      #@family_history = FamilyHistory.new(family_history_params)
      #
      #respond_to do |format|
      #  if @family_history.save
      #    format.html { redirect_to @family_history, notice: 'Family history was successfully created.' }
      #    format.json { render action: 'show', status: :created, location: @family_history }
      #  else
      #    format.html { render action: 'new' }
      #    format.json { render json: @family_history.errors, status: :unprocessable_entity }
      #  end
      #end
      render :status => 501
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_history_params
      params[:family_history]
    end
  end
end

