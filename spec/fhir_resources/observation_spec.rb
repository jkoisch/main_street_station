require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Observation do
  subject {Fhir::Observation}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation.json') }
  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation-2.json') }
  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation-3.json') }
  it { should parse_ehmbr_response('spec/support-files/ehmbr/observation-4.json') }
end