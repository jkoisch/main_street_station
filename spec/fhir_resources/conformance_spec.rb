require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Conformance do
  subject { Fhir::Conformance }

  it { should parse_ehmbr_response('config/conformance.json') }
end