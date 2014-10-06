require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::FamilyHistory do
  subject {Fhir::FamilyHistory}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/family-history.json') }
end