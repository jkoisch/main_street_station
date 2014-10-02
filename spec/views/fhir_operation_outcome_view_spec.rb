require 'spec_helper'

describe 'FHIR OperationOutcome View' do
  it 'should produce valid JSON' do
    @operation_outcome = YAML.load(File.read('spec/support-files/fhir/operation_outcome/operation-outcome.yaml'))
    response = render template: 'fhir/fhir_base/operation_outcome', formats: :json
    expected = File.read('spec/support-files/fhir/operation_outcome/fhir-operation-outcome.json')
    expect(response).to eq(expected)
  end

  it 'should produce valid XML' do
    @operation_outcome = YAML.load(File.read('spec/support-files/fhir/operation_outcome/operation-outcome.yaml'))
    response = render template: 'fhir/fhir_base/operation_outcome', formats: :xml
    expected = File.read('spec/support-files/fhir/operation_outcome/fhir-operation-outcome.xml')
    expect(response).to eq(expected)
  end
end
