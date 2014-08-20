require 'spec_helper'
require 'support/fhir_matchers'

describe Fhir::Patient do
  subject {Fhir::Patient}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/client.json') }
end