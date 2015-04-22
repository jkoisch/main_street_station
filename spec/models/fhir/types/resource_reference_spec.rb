require 'rails_helper'

describe Fhir::Types::ResourceReference do

  it 'should format a reference' do
    thing = Fhir::Types::ResourceReference.new(local_id: 3, local_type: 'observation')
    expect(thing.reference).to eq 'http://mainstreet.youcentric.com/fhir/Observation/3'
  end

  it 'should convert client in a reference' do
    thing = Fhir::Types::ResourceReference.new(local_id: 3, local_type: 'client')
    expect(thing.reference).to eq 'http://mainstreet.youcentric.com/fhir/Patient/3'
  end

  it 'should convert provider in a reference' do
    thing = Fhir::Types::ResourceReference.new(local_id: 3, local_type: 'Provider')
    expect(thing.reference).to eq 'http://mainstreet.youcentric.com/fhir/Practitioner/3'
  end

  it 'should convert family_history in a reference' do
    thing = Fhir::Types::ResourceReference.new(local_id: 3, local_type: 'FamilyHistory')
    expect(thing.reference).to eq 'http://mainstreet.youcentric.com/fhir/FamilyMemberHistory/3'
  end

  it 'should repeat an external reference explicitly' do
    the_ref = 'http://healthintersections.com/fhir/BlahBlah/45'
    thing = Fhir::Types::ResourceReference.new(external_reference: the_ref)
    expect(thing.reference).to eq the_ref
  end
end