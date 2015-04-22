require 'rails_helper'

module Fhir
  module Types
    CONVERSION_NAMES = {'Patient'      => 'Client',
                        'Practitioner' => 'Provider',
                        'FamilyMemberHistory' => 'FamilyHistory'}
  end
end

describe Fhir::Types::GringottConversion do

  it 'should translate FHIR resource names to Gringotts names' do
    Fhir::Types::CONVERSION_NAMES.each_pair do |fhir_name, gringott_name|
      expect(subject.class.to_gringott_type(fhir_name)).to eq gringott_name
    end
  end

  it 'should translate Gringotts names to FHIR resource names' do
    Fhir::Types::CONVERSION_NAMES.each_pair do |fhir_name, gringott_name|
      expect(subject.class.from_gringott_type(gringott_name)).to eq fhir_name
    end
  end
end