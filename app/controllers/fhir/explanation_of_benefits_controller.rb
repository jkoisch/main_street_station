require 'net/http'

module Fhir
  class ExplanationOfBenefitsController < FhirController
    RESOURCE = 'explanation_of_benefit'

    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      Rails.logger.debug("response.body: #{response.body}")
      if response.success?
        @explanation_of_benefits = Fhir::ExplanationOfBenefit.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @explanation_of_benefit = Fhir::ExplanationOfBenefit.parse_ehmbr(response.body)
      else
        send_operation_outcome(response)
      end
    end

    private

    def build_search_params(params)
      supported_params = { patient:  Fhir::ReferenceParameter,
                           created: Fhir::DateParameter
                         }

      populate_search_parameters(supported_params, params)
    end

  end
end
