require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Practitioner do
  subject {Fhir::Practitioner}

  it { should parse_ehmbr_response('spec/support-files/ehmbr/provider.json') }
end
