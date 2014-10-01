require 'spec_helper'
require 'support/fhir_matchers'

describe Fhir::Location do
  subject { Fhir::Location }

  it { should parse_ehmbr_response('spec/support-files/ehmbr/location.json') }
end