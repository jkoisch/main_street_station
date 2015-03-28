require 'spec_helper'

describe Fhir::TokenParameter do

  context '.parse' do
    it 'should return simple code' do
      expect(subject.class.parse('test', 'value')).to eq({'test' => {'code' => 'value'}})
    end

    it 'should return system and code'do
      expect(subject.class.parse('test', 'x|value')).to eq({'test' => {'system' => 'x', 'code' => 'value'}})
    end

    it 'should return empty system and code'do
      expect(subject.class.parse('test', '|value')).to eq({'test' => {'system' => nil, 'code' => 'value'}})
    end

    it 'should return text-based search' do
      expect(subject.class.parse('test:text', 'value')).to eq({'test' => {'display' => 'value'}})
    end

    it 'should return not equal search' do
      expect(subject.class.parse('test:not', 'x|value')).to eq({'test' => {'system' => 'x', 'code' => 'value', 'modifier' => 'ne'}})
    end

    it 'should return contained in search' do
      expect(subject.class.parse('test:in', 'value')).to eq({'test' => {'valueset' => 'value'}})
    end

    it 'should return a not contained in search' do
      expect(subject.class.parse('test:not-in', 'value')).to eq({'test' => {'valueset' => 'value', 'modifier' => 'ne'}})
    end

    it 'should reject an above search' do
      expect {
        subject.class.parse('test:above', 'value')
      }.to raise_error(Fhir::ParameterException, "Unsupported modifier 'above' for token parameter 'test'")
    end

    it 'should reject a below search' do
      expect {
        subject.class.parse('test:below', 'value')
      }.to raise_error(Fhir::ParameterException, "Unsupported modifier 'below' for token parameter 'test'")
    end

    it 'should reject an invalid modifier'  do
      expect {
        subject.class.parse('test:fuzzy', 'value')
      }.to raise_error(Fhir::ParameterException, "Invalid modifier 'fuzzy' for token parameter 'test'")
    end

    it 'should create an array for multiple values' do
      expect(subject.class.parse('test', ['val1', 'val2'])).to eq({'test' => [{'code' => 'val1'},
                                                                              {'code' => 'val2'}]})
      expect(subject.class.parse('test', ['x|val1', 'y|val2'])).to eq({'test' => [{'system' => 'x', 'code' => 'val1'},
                                                                                  {'system' => 'y', 'code' => 'val2'}]})
    end

    it 'should distribute modifiers for multiple values' do
      expect(subject.class.parse('test:not', ['x|val1', 'y|val2'])).to eq({'test' => [{'system' => 'x', 'code' => 'val1', 'modifier' => 'ne'},
                                                                                      {'system' => 'y', 'code' => 'val2', 'modifier' => 'ne'}]})
    end

    it 'should create an array with correct value names' do
      expect(subject.class.parse('test:not-in', ['set1', 'set2'])).to eq({'test' => [{'valueset' => 'set1', 'modifier' => 'ne'},
                                                                         {'valueset' => 'set2', 'modifier' => 'ne'}]})
    end
  end
end