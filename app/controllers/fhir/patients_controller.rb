require "fhir/patient"
require "fhir/patients"
require 'net/http'

class Fhir::PatientsController < ApplicationController
  respond_to :json

  def get_patient_json_from_external_server(location = "/Users/drodriguez/FHIR-Patient_Files/Ewout_Patients_All.json")

    file = File.open(location)
    data = file.read

  end

  def get_client_json_from_gringotts(id)

    uri = URI('http://gringotts.dev/clients/' + id) #'http://hl7connect.healthintersections.com.au/svc/fhir/patient/@' + (id.to_s) +'?_format=json')
    Net::HTTP.get(uri)

  end

  # GET /patients
  # GET /patients.json
  def index

    patient_data = get_patient_json_from_external_server()

    fhir_json_struct = JSON.parse(patient_data, opts={:symbolize_names => true})
    @patients = FHIR::Patients.init_from_ember(fhir_json_struct)

  end

  # GET /patients/1  #from gringotts file
  # GET /patients/1.json
  def show
    client_data = get_client_json_from_gringotts(params[:id])
    gringotts_json_struct = JSON.parse(client_data, opts={:symbolize_names => true})
    @patient = FHIR::Patient.init_from_ember(gringotts_json_struct, 'gringotts')

  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
