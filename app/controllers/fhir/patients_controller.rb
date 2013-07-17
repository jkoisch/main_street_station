require "fhir/patient"
require "fhir/patients"
require 'net/http'

class Fhir::PatientsController < ApplicationController

  def index
      patient_data = get_patient_json_from_external_server()
      gringotts_json_struct = JSON.parse(patient_data, opts={:symbolize_names => true})
      @patients = FHIR::Patients.init_from_ember(gringotts_json_struct)

    respond_to do |format|
      format.html
      format.atom
      format.json
      format.xml
    end
  end

  def show
    client_data = get_client_json_by_id(params[:id][1..-1])
    gringotts_json_struct = JSON.parse(client_data, opts={:symbolize_names => true})
    @patient = FHIR::Patient.init_from_ember(gringotts_json_struct, 'gringotts')

    respond_to do |format|
      format.html
      format.json do
        render :json => custom_json_for(@patient)
      end
      format.xml
    end
  end

  def search
    @patients = search_gringotts(params)

    render json: @patients.body

  end

  private

  def get_patient_json_from_external_server() #location = "/Users/drodriguez/FHIR-Patient_Files/Ewout_Patients_All.json")

    uri = URI('http://gringotts.dev/clients/')
    Net::HTTP.get(uri)

  end

  def get_client_json_by_id(id)

    uri = URI('http://gringotts.dev/clients/' + id)
    Net::HTTP.get(uri)

  end

  def search_gringotts(params)

    supported_params = [:name, :birthdate_before, :birthdate_after, :family, :given]

    uri = URI('http://gringotts.dev/clients/')

    search_params = ""
    params.slice(*supported_params).each do |scope, value|
      search_params << "query[#{scope}_search]=#{value}"
      #search_params << "query[#{scope}]=#{value}" #for birthdate_before and birthdate_after
      uri.query = URI.encode(search_params)
    end
    Net::HTTP.get_response(uri)

  end

end
