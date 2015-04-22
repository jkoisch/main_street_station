require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::FamilyMemberHistory do
  subject {Fhir::FamilyMemberHistory}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/family-history.json') }
end