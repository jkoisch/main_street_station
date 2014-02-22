require 'spec_helper'
require 'support/fhir_matchers'

describe 'Questionnaire - General Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/fhir-questionnaire_general.json')) }
  subject {Fhir::Questionnaire}

  it { should parse_ehmbr_response(raw_json) }
end

describe 'Questionnaire - Lifelines Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/fhir-questionnaire_lifelines.json')) }
  subject {Fhir::Questionnaire}

  it { should parse_ehmbr_response(raw_json) }
end

describe 'Questionnaire - Bluebook Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/fhir-questionnaire_bluebook.json')) }
  subject {Fhir::Questionnaire}

  it { should parse_ehmbr_response(raw_json) }
end