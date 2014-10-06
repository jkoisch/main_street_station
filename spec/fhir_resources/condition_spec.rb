require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Condition do
  subject {Fhir::Condition}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/condition.json') }
end