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

    def create
      response = create_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render nothing: true, status: 201, location: "#{FHIR_LOCATION_ROOT}/Condition/#{response.body[:id]}"
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
          render nothing: true, status: 200
        else
          send_operation_outcome(response, 400)
        end
      else
        send_operation_outcome(nil, 503, 'Application unavailable at this time')
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
