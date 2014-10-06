require 'rails_helper'
require 'support/fhir_matchers'

describe Fhir::Device do
  subject { Fhir::Device }

  it { should parse_ehmbr_response('spec/support-files/ehmbr/device.json') }
end