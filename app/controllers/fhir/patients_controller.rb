require 'net/http'

class Fhir::PatientsController < Fhir::FhirController
  #before_filter :https_redirect, :authenticate_user!

  RESOURCE = 'client'

  def index
    response = get_gringotts_resources(RESOURCE, build_search_params(params))
    if response.is_a?(Net::HTTPSuccess)
      json_data = JSON.parse(response.body, opts={:symbolize_names => true})
      @patients = FHIR::Patients.init_from_ember(json_data)

      respond_to do |format|
        format.html
        format.atom
        format.json
        format.xml
      end
    else
      respond :status => 500
    end
  end

  def show
    response = get_resource(RESOURCE, params[:id][1..-1])
    if response.is_a?(Net::HTTPSuccess)
      json_data = JSON.parse(response.body, opts={:symbolize_names => true})
      @patient = FHIR::Patient.init_from_ember(json_data)

      respond_to do |format|
        format.html
        format.json
        format.xml
      end
    else
      logger.debug response
      render :status => 500
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
