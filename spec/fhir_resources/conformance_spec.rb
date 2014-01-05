require 'spec_helper'
require 'support/fhir_matchers'

describe 'Conformance Resource' do
  let(:raw_json) { JSON.parse(File.read('config/conformance.json')) }
  subject { Fhir::Conformance }

  it { should parse_ehmbr_response(raw_json) }
end