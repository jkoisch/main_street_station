require 'rails_helper'

describe Fhir::Types::Reference do

  it 'should format a reference' do
    thing = Fhir::Types::Reference.new(local_id: 3, local_type: 'Observation')
    expect(thing.reference).to eq 'Observation/3'
  end

  it 'should convert client in a reference' do
    thing = Fhir::Types::Reference.new(local_id: 3, local_type: 'client')
    expect(thing.reference).to eq 'Patient/3'
  end

  it 'should convert provider in a reference' do
    thing = Fhir::Types::Reference.new(local_id: 3, local_type: 'Provider')
    expect(thing.reference).to eq 'Practitioner/3'
  end

  it 'should convert family_history in a reference' do
    thing = Fhir::Types::Reference.new(local_id: 3, local_type: 'FamilyHistory')
    expect(thing.reference).to eq 'FamilyMemberHistory/3'
  end

  it 'should repeat an external reference explicitly' do
    the_ref = 'http://healthintersections.com/fhir/BlahBlah/45'
    thing = Fhir::Types::Reference.new(external: the_ref)
    expect(thing.reference).to eq the_ref
  end
end