require 'rspec'

describe Fhir::StringParameter do

  context '.parse' do
    it 'should return a simple value' do
      expect(subject.class.parse('test', 'value')).to eq({'test' => {'value' => 'value'}})
    end

    it 'should specify an exact match' do
      expect(subject.class.parse('test:exact', 'value')).to eq({'test' => {'value' => 'value', 'modifier' => 'ex'}})
    end

    it 'should throw an error for an unsupported modifier' do
      expect {
        subject.class.parse('test:fuzzy', 'some value') }.to raise_error(Fhir::ParameterException,
                                                             "Invalid modifier 'fuzzy' for string parameter 'test'")
    end
  end
end