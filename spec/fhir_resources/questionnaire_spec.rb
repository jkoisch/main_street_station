require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Questionnaire do
  subject {Fhir::Questionnaire}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/questionnaire.json') }
end
