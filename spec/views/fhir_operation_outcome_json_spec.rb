require 'spec_helper'

describe "fhir/operation_outcomes/show" do
  let(:resource) { YAML.load(File.read('spec/support-files/operation_outcome.yaml')) }

  it {should produce_fhir_json_like('spec/support-files/fhir-operation_outcome.json')}
end
