require "fhir/observation"
require "fhir/observations"
require "net/http"

class Fhir::ObservationsController < ApplicationController

  def index
    observation_data = get_data_from_external_source()
    gringotts_struct = JSON.parse(observation_data, opts={:symbolize_names => true})
    @observations = FHIR::Observations.init_from_ember(gringotts_struct)
    #@observation = FHIR::Observation.parse_input(gringotts_struct, 'gringotts')

    @x = render 'index', :formats => :json
    create_Deontik_Observation(@x)
    logger.debug @x
    #respond_to do |format|
    #  format.html
    #  format.atom
    #  format.json
    #  format.xml
    #end
  end

  def create_Deontik_Observation(dtl)
    #ext = params['_format']
    url = URI.parse(MainStreetStation::Application.config.ewout_url)  #deontik_url)

    http = Net::HTTP.new(url.host, url.port)
    req = Net::HTTP::Post.new(url.path)
    req.body = dtl[0].to_s  #.to_json # get_test_data_to_export(ext)
    req['Content-Type'] = "application/json+fhir; charset=UTF-8" #"application/json+fhir; charset=UTF-8"

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
    @observation = FHIR::Observation.parse_input(gringotts_struct, 'gringotts')

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

  def get_data_from_external_source()
    f = File.read(MainStreetStation::Application.config.observation_home_url)
    #uri = URI(MainStreetStation::Application.config.observation_home_url)
    #Net::HTTP.get(uri)
  end

  def get_data_by_id(id)
    uri = URI('http://gringotts.dev/observations/' + id)
    Net::HTTP.get(uri)
  end

end
