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

    it 'should return an array for multiple values' do
      expect(subject.class.parse('test', ['value', 'value2'])).to eq({'test' => [{'value' => 'value'}, {'value' => 'value2'}]})
    end

    it 'should return multiple value with a modifier' do
      expect(subject.class.parse('test:exact', ['val1', 'val2'])).to eq({'test' =>
                                                                             [{'value' => 'val1', 'modifier' => 'ex'},
                                                                              {'value' => 'val2', 'modifier' => 'ex'}]})
    end
  end
end