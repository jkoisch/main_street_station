require 'spec_helper'
require 'support/fhir_matchers'

describe 'Family History Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/family_history.json')) }
  subject {Fhir::FamilyHistory}

  it { should parse_ehmbr_response(raw_json) }
end