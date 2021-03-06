require 'rails_helper'
require 'fhir/operation_outcome'

describe 'FHIR OperationOutcome View', type: :view do
  it 'should produce valid JSON' do
    @operation_outcome = YAML.load(File.read('spec/support-files/fhir/operation_outcome/operation-outcome.yaml'))
    response = render template: 'fhir/fhir_base/operation_outcome', formats: :fhirj
    expected = File.read('spec/support-files/fhir/operation_outcome/fhir-operation-outcome.json')
    expect(response).to eq(expected)
  end

  it 'should produce valid XML' do
    @operation_outcome = YAML.load(File.read('spec/support-files/fhir/operation_outcome/operation-outcome.yaml'))
    response = render template: 'fhir/fhir_base/operation_outcome', formats: :fhirx
    expected = File.read('spec/support-files/fhir/operation_outcome/fhir-operation-outcome.xml')
    expect(response).to eq(expected)
  end
end
