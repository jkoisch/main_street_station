require 'net/http'

module Fhir
  class PractitionersController < FhirController
    RESOURCE = 'provider'

    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      if response.success?
        @practitioners = Fhir::Practitioner.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @practitioner = Fhir::Practitioner.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def create
      response = create_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render nothing: true, status: 201, location: "#{FHIR_LOCATION_ROOT}/Practitioner/#{response.body[:id]}"
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

    def build_search_params(params)
      supported_params = {  address:        Fhir::StringParameter,
                            communication:  Fhir::TokenParameter,
                            identifier:     Fhir::TokenParameter,
                            location:       Fhir::ReferenceParameter
                          }

      populate_search_parameters(supported_params, params)
    end
  end
end
