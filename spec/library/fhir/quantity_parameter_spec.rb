require 'rails_helper'

describe Fhir::QuantityParameter do

  context '.parse' do
    it 'should return simple quantity' do
      expect(subject.class.parse('test', 'value')).to eq({'test' => {'value' => 'value'}})
    end

    it 'should return greater than value'do
      expect(subject.class.parse('test', '>23')).to eq({'test' => {'value' => '23', 'modifier' => 'gt'}})
    end

    it 'should return greater than or equal value'do
      expect(subject.class.parse('test', '>=value')).to eq({'test' => {'value' => 'value', 'modifier' => 'ge'}})
    end

    it 'should return less than value'do
      expect(subject.class.parse('test', '<value')).to eq({'test' => {'value' => 'value', 'modifier' => 'lt'}})
    end

    it 'should return less than or equal value'do
      expect(subject.class.parse('test', '<=value')).to eq({'test' => {'value' => 'value', 'modifier' => 'le'}})
    end

    it 'should return approximate value'do
      expect(subject.class.parse('test', '~34')).to eq({'test' => {'value' => '34', 'modifier' => 'ap'}})
    end

    it 'should return not equal value'do
      expect(subject.class.parse('test', '!=34')).to eq({'test' => {'value' => '34', 'modifier' => 'ne'}})
    end

    it 'should return quantity and code'do
      expect(subject.class.parse('test', '3.6||mg')).to eq({'test' => {'code' => 'mg', 'value' => '3.6'}})
    end

    it 'should fail with no quantity value'do
      expect{ subject.class.parse('test', '|value') }.to raise_exception(Fhir::ParameterException)
    end

    it 'should return multiple modifiers and parameters' do
      expect(subject.class.parse('test', '!=5|http://unitsofmeasure.org|mg')).to eq({'test' => {'system' => 'http://unitsofmeasure.org', 'code' => 'mg', 'value' => '5', 'modifier' => 'ne'}})
    end
  end
end