require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Organization do
  subject {Fhir::Organization}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/organization.json') }
end