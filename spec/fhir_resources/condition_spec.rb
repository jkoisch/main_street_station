require 'spec_helper'
require 'support/fhir_matchers'

describe 'Condition Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/condition_general.json')) }
  subject {Fhir::Condition}

  it { should parse_ehmbr_response(raw_json) }
end