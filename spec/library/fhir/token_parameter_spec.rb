require 'rspec'

describe Fhir::TokenParameter do

  context '::parse' do
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
      expect(subject.class.parse('test:not', 'x|value')).to eq({'test' => {'system' => 'x', 'code:ne' => 'value'}})
    end

    it 'should return contained in search' do
      expect(subject.class.parse('test:in', 'value')).to eq({'test' => {'valueset' => 'value'}})
    end

    it 'should return a not contained in search' do
      expect(subject.class.parse('test:not-in', 'value')).to eq({'test' => {'valueset:ne' => 'value'}})
    end

    it 'should reject an above search'

    it 'should reject a below search'
  end
end