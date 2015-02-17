require 'rspec'

describe Fhir::NumberParameter do

  context '.parse' do
    it 'should return simple value' do
      expect(subject.class.parse('test', 'value')).to eq({'test' => {'value' => 'value'}})
    end

    it 'should return greater than value' do
      expect(subject.class.parse('test', '>value')).to eq({'test' => {'value' => 'value', 'modifier' => 'gt'}})
    end

    it 'should return greater than or equal value' do
      expect(subject.class.parse('test', '>=value')).to eq({'test' => {'value' => 'value', 'modifier' => 'ge'}})
    end

    it 'should return less than value' do
      expect(subject.class.parse('test', '<value')).to eq({'test' => {'value' => 'value', 'modifier' => 'lt'}})
    end

    it 'should return less than or equal value' do
      expect(subject.class.parse('test', '<=value')).to eq({'test' => {'value' => 'value', 'modifier' => 'le'}})
    end

    it 'should return a not equal search' do
      expect(subject.class.parse('test', '!=value')).to eq({'test' => {'value' => 'value', 'modifier' => 'ne'}})
    end

  end
end