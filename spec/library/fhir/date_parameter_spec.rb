require 'rspec'

describe Fhir::DateParameter do

  context '::parse' do
    it 'should return simple value' do
      expect(subject.class.parse('test', 'value')).to eq({'test' => 'value'})
    end

    it 'should return greater than value'do
      expect(subject.class.parse('test', '>value')).to eq({'test:gt' => 'value'})
    end

    it 'should return greater than or equal value'do
      expect(subject.class.parse('test', '>=value')).to eq({'test:ge' => 'value'})
    end

    it 'should return less than value'do
      expect(subject.class.parse('test', '<value')).to eq({'test:lt' => 'value'})
    end

    it 'should return less than or equal value'do
      expect(subject.class.parse('test', '<=value')).to eq({'test:le' => 'value'})
    end

  end
end