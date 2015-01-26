require 'rails_helper'

class FhirBaseTestClass < Fhir::BaseResource
end

describe '#to_partial_path' do

  it 'returns a partial path for a given FHIR class' do
    expect(FhirBaseTestClass.new.to_partial_path).to eq 'fhir_base_test_class'
  end

end