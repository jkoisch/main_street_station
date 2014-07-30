require 'spec_helper'
require 'support/fhir_matchers'

describe Fhir::Organization do
  subject {Fhir::Organization}

  it { should parse_ehmbr_response('spec/support-files/organization.json') }
end