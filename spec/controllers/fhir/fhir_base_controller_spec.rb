require 'rails_helper'

describe Fhir::FhirBaseController do
  context '#query_params' do
    it 'should parse an empty query string' do
      request = Object.new
      request.stubs(:query_string).returns('')
      Fhir::FhirBaseController.any_instance.stubs(request: request)
      expect(subject.query_params).to eq({})
    end

    it 'should parse a query string with a single parameter' do
      request = Object.new
      request.stubs(:query_string).returns('this=that')
      Fhir::FhirBaseController.any_instance.stubs(request: request)
      expect(subject.query_params).to eq({'this' => 'that'})
    end

    it 'should parse a query string with multiple parameters' do
      request = Object.new
      request.stubs(:query_string).returns('this=that&something=else')
      Fhir::FhirBaseController.any_instance.stubs(request: request)
      expect(subject.query_params).to eq({'this' => 'that', 'something' => 'else'})
    end

    it 'should parse a query string with a repeated parameter' do
      request = Object.new
      request.stubs(:query_string).returns('this=that&this=another')
      Fhir::FhirBaseController.any_instance.stubs(request: request)
      expect(subject.query_params).to eq({'this' => ['that','another']})
    end

    it 'should URI decode parsed parameter values' do
      request = Object.new
      request.stubs(:query_string).returns('this=that&something=or%20else&this=%3C=another&this=%3Enothing')
      Fhir::FhirBaseController.any_instance.stubs(request: request)
      expect(subject.query_params).to eq({'this' => ['that','<=another', '>nothing'], 'something' => 'or else'})
    end
  end

  context '#populate_search_parameters' do
    it 'should produce a single query parameter' do
      list = { thing1: Fhir::StringParameter, thing2: Fhir::StringParameter}
      params = { 'thing1' => 'fun'}
      expect(subject.populate_search_parameters(list, params)).to eq 'query[thing1][value]=fun'
    end

    it 'should produce a list of query parameters' do
      list = { thing1: Fhir::StringParameter, thing2: Fhir::StringParameter}
      params = { 'thing1' => 'fun', 'thing2' => 'frolic'}
      expect(subject.populate_search_parameters(list, params)).to eq 'query[thing1][value]=fun&query[thing2][value]=frolic'
    end

    it 'should produce an array for a query parameter with multiple' do
      list = { thing1: Fhir::StringParameter, thing2: Fhir::StringParameter}
      params = { 'thing1' => ['fun', 'frolic']}
      expect(subject.populate_search_parameters(list, params)).to eq 'query[thing1][][value]=fun&query[thing1][][value]=frolic'
    end

    it 'should produce a null query string when no fields match' do
      list = { thing1: Fhir::StringParameter, thing2: Fhir::StringParameter}
      params = { 'catinhat' => 'fun'}
      expect(subject.populate_search_parameters(list, params)).to eq ''
    end

    it 'should process a parameter that has a modifier' do
      list = { thing1: Fhir::StringParameter, thing2: Fhir::StringParameter}
      params = { 'thing1:exact' => 'fun'}
      #expect(subject.populate_search_parameters(list, params)).to eq 'query[thing1:exact]=fun'
      expect(subject.populate_search_parameters(list,
                                                params)).to eq 'query[thing1][modifier]=ex&query[thing1][value]=fun'
    end

    it 'should process a reference search parameter' do
      list = { thing1: Fhir::ReferenceParameter}
      params = {'thing1:patient' => '23'}
      expect(subject.populate_search_parameters(list, params)).to eq 'query[thing1][resource]=Client&query[thing1][value]=23'
    end

    it 'should process a parameter that has an invalid modifier' do
      list = { thing1: Fhir::StringParameter, thing2: Fhir::StringParameter}
      params = { 'thing1:simple' => 'fun'}
      expect {
        subject.populate_search_parameters(list, params)}.to raise_error(Fhir::ParameterException,
                                                             "Invalid modifier 'simple' for string parameter 'thing1'")
    end
  end

  context '#produce_query_string' do
    it 'should produce an empty string when no query entries' do
      queries = []
      expect(subject.produce_query_string(queries)).to eq ''
    end

    it 'should translate a query entry into a single query string' do
      queries = [{'thing' => 'value'}]
      expect(subject.produce_query_string(queries)).to eq 'query[thing]=value'
    end

    it 'should translate a query entry with an array query string' do
      queries = [{'thing' => ['value', 'value2']}]
      expect(subject.produce_query_string(queries)).to eq 'query[thing][]=value&query[thing][]=value2'
    end

    it 'should translate multiple query entries into a string with multiple queries' do
      queries = [{'thing' => 'value1'}, {'other-thing' => 'value2'}]
      expect(subject.produce_query_string(queries)).to eq 'query[other-thing]=value2&query[thing]=value1'
    end

    it 'should translate sub-query entries' do
      queries = [{'thing' => { 'field-a' => 'value1', 'field-b' => 'value2'}}]
      expect(subject.produce_query_string(queries)).to eq 'query[thing][field-a]=value1&query[thing][field-b]=value2'
    end
  end
end