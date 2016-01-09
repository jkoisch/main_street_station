require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::ExplanationOfBenefit do
  subject {Fhir::ExplanationOfBenefit}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/eob.json') }
end