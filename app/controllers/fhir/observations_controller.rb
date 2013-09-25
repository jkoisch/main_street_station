require "fhir/observation"
require "net/http"

class Fhir::ObservationsController < ApplicationController

  def index
    observation_data = get_data_from_external_server()
    gringotts_struct = JSON.parse(observation_data, opts={:symbolize_names => true})
    @observations = FHIR::Patients.init_from_ember(gringotts_json_struct)

    respond_to do |format|
      format.html
      format.atom
      format.json
      format.xml
    end
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

  def get_data_from_external_server()
    uri = URI(MainStreetStation::Application.config.gringotts_url)
    Net::HTTP.get(uri)
  end

  def get_data_by_id(id)
    uri = URI('http://gringotts.dev/observations/' + id)
    Net::HTTP.get(uri)
  end

end
