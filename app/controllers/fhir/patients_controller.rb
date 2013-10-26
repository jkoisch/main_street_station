require "fhir/patient"
require "fhir/patients"
require 'net/http'

class Fhir::PatientsController < ApplicationController
  #before_filter :https_redirect, :authenticate_user!

  def index

    gringotts_data = get_data_from_external_server()
    patients_data = JSON.parse(gringotts_data, opts={:symbolize_names => true})
    @patients = FHIR::Patients.init_from_ember(patients_data)

    respond_to do |format|
      format.html
      format.atom
      format.json
      format.xml
    end
  end

  def show
    #if request.ssl?
      client_response = get_data_by_id(params[:id][1..-1])
      if client_response.is_a?(Net::HTTPSuccess)
        logger.debug 'success in patient_controller show method'
      else
        logger.debug client_response
      end

      gringotts_json_struct = JSON.parse(client_response.body, opts={:symbolize_names => true})
      @patient = FHIR::Patient.init_from_ember(gringotts_json_struct, 'gringotts')

      respond_to do |format|
        format.html
        format.json
        format.xml
      end

    #end
  end

  def search
    @patients = search_gringotts(params)
    respond_to do |format|
      format.json @patients.body
      format.xml @patients.body
    end
    #render json: @patients.body
  end

  def create
    ext = params['_format']
    url = URI.parse(MainStreetStation::Application.config.grahame_url + ext)

    http = Net::HTTP.new(url.host, url.port)
    req = Net::HTTP::Post.new(url.path)
    req.body = get_test_data_to_export(ext)
    req['Content-Type'] = "application/fhir+" + ext + "; charset=UTF-8"

    response = http.request(req)

    case response
      when Net::HTTPSuccess then response
      when Net::HTTPRedirection then fetch(response['location'], limit - 1)
    else
        response.error!
    end
    render :action => "show"
  end

  private

  def get_test_data_to_export(ext)
    f = File.read("#{Rails.root}/config/gringotts_test." + ext)

    case ext
      when "xml"
        #f = File.open("#{Rails.root}/config/gringotts_test." + ext)
        doc = Nokogiri::XML(f)
        #f.close
        return doc.to_s
      when "json"
        doc = JSON.parse(f)
        return doc.to_json
    end
  end

  def get_data_from_external_server()
    uri = URI(MainStreetStation::Application.config.gringotts_url)
    Net::HTTP.get(uri)
  end

  def get_data_by_id(id)
    #--DEV--
    uri = URI(MainStreetStation::Application.config.gringotts_url + id)
    #--PROD--
    #uri = URI(ENV['GRINGOTTS_URL'] + id)
    res = Net::HTTP.get_response(uri)
  end

  def search_gringotts(params)

    supported_params = [:name, :birthdate_before, :birthdate_after, :family, :given, :gender, :id, :system]

    #--DEV--
    uri = URI(MainStreetStation::Application.config.gringotts_url)
    #--PROD--
    #uri = URI(ENV['GRINGOTTS_URL'])
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
            #todo regex for m, f, un (undifferentiated), and unk (unknown) only and to do upper
            value = value.upcase
          end

          search_params << "query[#{scope}_search]=#{value}"
      end
    end

    uri.query = URI.encode(search_params)
    #logger.debug uri
    return Net::HTTP.get_response(uri)
  end
end
