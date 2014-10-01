require 'spec_helper'
require 'support/fhir_matchers'

describe Fhir::Observation do
  subject {Fhir::Observation}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation.json') }
end