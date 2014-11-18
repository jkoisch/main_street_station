require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Observation do
  subject {Fhir::Observation}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation.json') }
  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation2.json') }
  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation3.json') }
  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation4.json') }
end