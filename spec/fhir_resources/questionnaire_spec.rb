require 'spec_helper'
require 'support/fhir_matchers'

describe Fhir::Questionnaire do
  subject {Fhir::Questionnaire}

  it { should parse_ehmbr_response('spec/support-files/questionnaire_general.json') }
  it { should parse_ehmbr_response('spec/support-files/questionnaire_lifelines.json') }
  it { should parse_ehmbr_response('spec/support-files/questionnaire_bluebook.json') }
end
