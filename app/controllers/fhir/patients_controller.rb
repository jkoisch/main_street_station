require 'net/http'

module Fhir
  class PatientsController < FhirBaseController
    RESOURCE = 'client'

    def index
      response = get_gringotts_resources(RESOURCE, build_search_params(params))
      if response.success?
        @patients = Fhir::Patient.parse_ehmbr_list(response.body)

        respond_to do |format|
          #format.html
          #format.atom
          format.json
          #format.xml
        end
      else
        logger.warn response
        respond_to do |format|
          format.html do
            render html:Fhir::OperationOutcome.new, status: 500
          end
          format.json do
            render json: Fhir::OperationOutcome.new, status: :unprocessable_entity
          end
          #format.xml  status: 500
        end
      end
    end

    def show
      response = get_resource(RESOURCE, params[:id])
      if response.success?
        @patient = Fhir::Patient.parse_ehmbr(response.body)
      else
        logger.warn response
        render status: 500
      end
    end

    def create
      #ext = params['_format']
      #url = URI.parse(MainStreetStation::Application.config.grahame_url + ext)
      #
      #http = Net::HTTP.new(url.host, url.port)
      #req = Net::HTTP::Post.new(url.path)
      #req.body = get_test_data_to_export(ext)
      #req['Content-Type'] = "application/fhir+" + ext + "; charset=UTF-8"
      #
      #response = http.request(req)
      #
      #case response
      #  when Net::HTTPSuccess then response
      #  when Net::HTTPRedirection then fetch(response['location'], limit - 1)
      #else
      #    response.error!
      #end
      render :status => 501
    end

    private
    def build_search_params(params)

      supported_params = [:name, :birthdate_before, :birthdate_after, :family,
                          :given, :gender, :id, :system]

      search_params = ""
      params.slice(*supported_params).each do |scope, value|
        case scope
          when "birthdate_after", "birthdate_before"
            search_params << "query[#{scope}]=#{value}"
          when "id", "system"
            if search_params.empty?
              search_params << "query[id_search][#{scope}]=#{value}"
            else
              search_params << ";query[id_search][#{scope}]=#{value}"
            end
          else
            if scope == "gender"
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
