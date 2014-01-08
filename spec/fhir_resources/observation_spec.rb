require 'spec_helper'
require 'support/fhir_matchers'

describe 'Observation Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/observation.json')) }
  subject {Fhir::Observation}

  it { should parse_ehmbr_response(raw_json) }
end