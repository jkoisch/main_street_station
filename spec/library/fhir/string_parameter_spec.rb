require 'rspec'

describe Fhir::StringParameter do

  context '::parse' do
    it 'should return a simple value' do
      expect(subject.class.parse('test', 'value')).to eq({'test' => 'value'})
    end

    it 'should specify an exact match' do
      expect(subject.class.parse('test:exact', 'value')).to eq({'test:exact' => 'value'})
    end

    it 'should do something for an unsupported modifier'
  end
end