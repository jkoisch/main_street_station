require 'net/http'

module Fhir
  class FamilyMemberHistoriesController < FhirController
    RESOURCE = 'family_history'

    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      if response.success?
        @family_member_histories = Fhir::FamilyMemberHistory.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @family_member_history = Fhir::FamilyMemberHistory.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def create
      response = create_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render body: nil, status: 201, location: "#{FHIR_LOCATION_ROOT}/FamilyMemberHistory/#{response.body[:id]}"
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_member_history_params
      params[:family_member_history]
    end

    def build_search_params(params)
      supported_params = { patient: Fhir::ReferenceParameter }

      populate_search_parameters(supported_params, params)
    end
  end
end

