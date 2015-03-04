require 'net/http'

module Fhir
  class PatientsController < FhirBaseController
    RESOURCE = 'client'

    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      if response.success?
        @patients = Fhir::Patient.parse_ehmbr_list(response.body)
      else
        send_operation_outcome(response)
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @patient = Fhir::Patient.parse_ehmbr(response.body)
        value = @patient
      else
        send_operation_outcome(response)
      end
    end

    def create
      response = create_gringotts_resource(RESOURCE, params)
      if response
        if response.success?
          render nothing: true, status: 201, location: "#{FHIR_LOCATION_ROOT}/Patient/#{response.body[:id]}"
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
      supported_params = { active:      Fhir::TokenParameter,
                           address:     Fhir::StringParameter,
                           birthdate:   Fhir::DateParameter,
                           family:      Fhir::StringParameter,
                           gender:      Fhir::TokenParameter,
                           given:       Fhir::StringParameter,
                           identifier:  Fhir::TokenParameter,
                           name:        Fhir::StringParameter,
                           telecom:     Fhir::StringParameter
                          }

      populate_search_parameters(supported_params, params)
    end

    def old_build_search_params(params)

      supported_params = [:name, :birthdate_before, :birthdate_after, :family,
                          :given, :gender, :id, :system]

      search_params = ''
      params.slice(*supported_params).each do |scope, value|
        case scope
          when 'birthdate_after', 'birthdate_before'
            search_params << "query[#{scope}]=#{value}"
          when 'id', 'system'
            if search_params.empty?
              search_params << "query[id_search][#{scope}]=#{value}"
            else
              search_params << ";query[id_search][#{scope}]=#{value}"
            end
          else
            if scope == 'gender'
              #TODO: regex for m, f, un (undifferentiated),
              # and unk (unknown) only and to do upper
              value = value.upcase
            end

            search_params << "query[#{scope}_search]=#{value}"
        end
      end
      search_params
    end
  end
end
