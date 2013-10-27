require "fhir/observation"
require "fhir/observations"
require "net/http"

class Fhir::ObservationsController < ApplicationController

  def index
    observation_data = get_data_from_external_source()
    gringotts_struct = JSON.parse(observation_data, opts={:symbolize_names => true})
    @observations = FHIR::Observations.init_from_ember(gringotts_struct)

    @details = respond_to do |format|
      format.html
      #format.atom
      format.json
      format.xml
    end

    #logger.debug @details
    #create_Deontik_Observation(@details)

  end

  def create_Deontik_Observation(dtl)
    #ext = params['_format']
    url = URI.parse(MainStreetStation::Application.config.deontik_url)

    http = Net::HTTP.new(url.host, url.port)
    req = Net::HTTP::Post.new(url.path)
    req.body = dtl[0].to_s
    req['Content-Type'] = "application/json+fhir; charset=UTF-8"

    response = http.request(req)

    case response
      when Net::HTTPSuccess || Net::HTTPOK then response
      when Net::HTTPRedirection then fetch(response['location'], limit - 1)
      else
        response.error!
    end

    render :action => "show"

  end

  def show
    observation_data = get_data_by_id(params[:id][1..-1])
    gringotts_struct = JSON.parse(observation_data, opts={:symbolize_names => true})
    @observation = FHIR::Observation.init_from_ember(gringotts_struct[:observation]) #, 'gringotts')

    respond_to do |format|
      format.html
      format.json
      #format.json do
      #  render :json => custom_json_for(@patient)
      #end
      format.xml
    end
  end

  private

  #right now we just want to read from a file
  def get_data_from_external_source()
    f = File.read("#{Rails.root}/config/gringott-observation-load.json")
    #f = File.read(MainStreetStation::Application.config.observation_home_url)
    #uri = URI(MainStreetStation::Application.config.observation_home_url)
    #Net::HTTP.get(uri)
  end

  def get_data_by_id(id)
    uri = URI('http://gringotts.dev/observations/' + id)
    Net::HTTP.get(uri)
  end

end
