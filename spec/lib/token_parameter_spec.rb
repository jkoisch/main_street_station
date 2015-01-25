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

    it 'should return text-based search'

    it 'should return not equal search'

    it 'should return contained in search'

    it 'should return a not contained in search'

  end
end