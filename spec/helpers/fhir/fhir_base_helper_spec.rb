require 'rails_helper'

ActionController::Base.append_view_path("#{Rails.root}/spec/support/views")

module Fhir
  class BundleTest < Poro
    attr_accessor :id, :name, :category

    def to_partial_path
      'bundle_test'
    end
  end
end

describe Fhir::FhirBaseHelper, type: :view do
  describe '#json_bundle' do
    subject {'fhir/fhir_base/index'}
    it 'should return a JSON FHIR Bundle for an empty array' do
      @things = []
      render template: 'fhir/fhir_base/index', formats: :json
      expect(response.body).to match_fhir_json(support_file('bundle/bundle-empty.json'),
                                               {'**/lastUpdated' => 'xxx'})
    end

    it 'should return a JSON FHIR Bundle for a single item' do
      @things = [ Fhir::BundleTest.new(id: 1, name: 'testing 1', category: 'expert') ]
      render template: 'fhir/fhir_base/index', formats: :json
      expect(response.body).to match_fhir_json(support_file('bundle/bundle-single.json'),
                                               {'**/lastUpdated' => 'xxx'})
    end

    it 'should return a JSON FHIR Bundle for a multiple items' do
      @things = [ Fhir::BundleTest.new(id: 1, name: 'testing 1', category: 'expert'),
                  Fhir::BundleTest.new(id: 2, name: 'testing 2', category: 'poser') ]
      render template: 'fhir/fhir_base/index', formats: :json
      expect(response.body).to match_fhir_json(support_file('bundle/bundle-multiple.json'),
                                               {'**/lastUpdated' => 'xxx'})
    end

    it 'should set the lastUpdated as a properly formatted datetime' do
      @things = []
      render template: 'fhir/fhir_base/index', formats: :json
      expect(json['meta']['lastUpdated']).to match(/20\d{2}-[01][0-9]-[0123][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]Z/)
    end
  end

  describe '#xml_bundle' do
    it 'should return an XML bundle for an empty array' do
      @things = []
      render template: 'fhir/fhir_base/index', formats: :xml
      expect(response.body).to match_fhir_xml(support_file('bundle/bundle-empty.xml'),
                                              {"//*[local-name()='lastUpdated']/@value" => 'xxx'})
    end

    it 'should return an XML bundle for a single item' do
      @things = [ Fhir::BundleTest.new(id: 1, name: 'testing 1', category: 'expert') ]
      render template: 'fhir/fhir_base/index', formats: :xml
      expect(response.body).to match_fhir_xml(support_file('bundle/bundle-single.xml'),
                                              {"//*[local-name()='lastUpdated']/@value" => 'xxx'})
    end

    it 'should return an XML bundle for a multiple items' do
      @things = [ Fhir::BundleTest.new(id: 1, name: 'testing 1', category: 'expert'),
                  Fhir::BundleTest.new(id: 2, name: 'testing 2', category: 'poser') ]
      render template: 'fhir/fhir_base/index', formats: :xml
      expect(response.body).to match_fhir_xml(support_file('bundle/bundle-multiple.xml'),
                                              {"//*[local-name()='lastUpdated']/@value" => 'xxx'})
    end

    it 'should set the lastUpdated as a properly formatted datetime' do
      @things = []
      render template: 'fhir/fhir_base/index', formats: :xml
      expect(xml.at_css('meta lastUpdated')['value']).to match(/20\d{2}-[01][0-9]-[0123][0-9]T[0-2][0-9]:[0-5][0-9]:[0-5][0-9]Z/)
    end
  end
end