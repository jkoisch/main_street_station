require 'spec_helper'

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

    it 'should return a value array with multiple values' do
      expect(subject.class.parse('test', ['val1', 'val2'])).to eq({'test' =>
                                                                           [{'value' => 'val1'},
                                                                            {'value' => 'val2'}]})
    end

    it 'should return a value array with multiple values and modifiers' do
      expect(subject.class.parse('test', ['<=val1', '>=val2'])).to eq({'test' =>
                                                                           [{'value' => 'val1', 'modifier' => 'le'},
                                                                           {'value' => 'val2', 'modifier' => 'ge'}]})
    end
  end
end