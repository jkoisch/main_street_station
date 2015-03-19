require 'rails_helper'

describe Fhir::ReferenceParameter do

  context '.parse' do
    it 'should return a simple reference' do
      expect(subject.class.parse('test', '23')).to eq({'test' => {'value' => '23'}})
    end

    it 'should return URL reference' do
      expect(subject.class.parse('test', 'http://healthintersections.com/fhir/Patient/23')).to eq({'test' => {'value' => 'http://healthintersections.com/fhir/Patient/23'}})
    end

    it 'should return a resource constraint for a reference' do
      expect(subject.class.parse('test:Observation', '23')).to eq({'test' => {'value' => '23', 'resource' => 'Observation'}})
    end

    it 'should return a resource constraint translated to Gringotts resource for a reference' do
      expect(subject.class.parse('test:Patient', '23')).to eq({'test' => {'value' => '23', 'resource' => 'Client'}})
    end

    it 'should return a chained field for a reference' do
      expect(subject.class.parse('test.name', 'Fred')).to eq({'test' => {'value' => 'Fred', 'field' => 'name'}})
    end

    it 'should return a resource constraint and a chained field for a reference' do
      expect(subject.class.parse('test:Patient.name', 'Fred')).to eq({'test' => {'value' => 'Fred', 'resource' => 'Client', 'field' => 'name'}})
    end
  end
end