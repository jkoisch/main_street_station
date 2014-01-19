require 'spec_helper'
require 'fhir/patient'

describe 'Patient Views' do

  describe "fhir/patient/show.json.jbuilder" do
    before do
      #Fhir::Patient
      @patient = YAML.load(File.read('spec/support-files/patient.yaml'))
    end

    it {should produce_fhir_json_like('spec/support-files/fhir-patient.json')}
  end

  describe "fhir/patient/show.xml.builder" do
    before do
      #Fhir::Patient
      @patient = YAML.load(File.read('spec/support-files/patient.yaml'))
    end

    it {should produce_fhir_xml_like('spec/support-files/fhir-patient.xml')}
  end
end