require 'spec_helper'
require 'support/fhir_matchers'

describe Fhir::FamilyHistory do
  subject {Fhir::FamilyHistory}

  it { should parse_ehmbr_response('spec/support-files/family_history.json') }
end