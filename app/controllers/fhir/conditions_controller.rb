require 'net/http'

module Fhir
  class ConditionsController < FhirController
    RESOURCE = 'condition'

    # GET /Condition
    # GET /Condition.json
    # GET /Condition.xml
    def index
      response = get_gringotts_resources(RESOURCE)
      logger.info "response: #{response.body}"
      if response.success?
        @conditions = Fhir::Condition.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    # GET /Condition/1
    # GET /Condition/1.json
    # GET /Condition/1.xml
    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @condition = Fhir::Condition.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condition_params
      params[:condition]
    end

    def build_search_params #()params)
      #TODO: Need implementation of search params
    end
  end

end
