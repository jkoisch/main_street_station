require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Coverage do
  subject { Fhir::Coverage }

  it { should parse_ehmbr_response('spec/support-files/ehmbr/coverage.json') }
end