require 'rails_helper'

describe "FHIR base-type address" do

  context 'JSON format' do
    context 'should populate lines' do
      let(:object) { yaml_load('base/address-lines.yaml') }

      it { should match_fhir_json('base/address-lines.json') }
    end
  end

  context 'XML format' do

  end
end