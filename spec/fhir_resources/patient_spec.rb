require 'spec_helper'
require 'support/fhir_matchers'

describe 'Patient Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/patient.json')) }
  subject {Fhir::Patient}

  it { should parse_ehmbr_response(raw_json) }
end