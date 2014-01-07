require 'spec_helper'
require 'support/fhir_matchers'

describe 'Device Resource' do
  let(:raw_json) { JSON.parse(File.read('spec/support-files/device.json')) }
  subject { Fhir::Device }

  it { should parse_ehmbr_response(raw_json) }
end