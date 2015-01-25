require 'rspec'

describe Fhir::DateParameter do

  context '::parse' do
    it 'should return simple value' do
      expect(subject.class.parse('test', 'value')).to eq({'test' => 'value'})
    end

    it 'should return greater than value'do
      expect(subject.class.parse('test', '>value')).to eq({'test_gt' => 'value'})
    end

    it 'should return greater than or equal value'do
      expect(subject.class.parse('test', '>=value')).to eq({'test_ge' => 'value'})
    end

    it 'should return less than value'do
      expect(subject.class.parse('test', '<value')).to eq({'test_lt' => 'value'})
    end

    it 'should return less than or equal value'do
      expect(subject.class.parse('test', '<=value')).to eq({'test_le' => 'value'})
    end

  end
end