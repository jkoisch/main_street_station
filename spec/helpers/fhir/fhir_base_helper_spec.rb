require "rails_helper"

ActionController::Base.append_view_path("#{Rails.root}/spec/support/views")

class BundleTest
  attr_accessor :name, :category

  def initialize(the_name, the_category)
    @name = the_name; @category = the_category
  end

  def to_partial_path
    'bundle_test'
  end
end

describe Fhir::FhirBaseHelper, type: :view do
  describe '#json_bundle' do
    subject {'fhir/fhir_base/index'}
    it 'returns a JSON FHIR Bundle for an empty array' do
      @things = []
      render template: 'fhir/fhir_base/index', formats: :json
      expect(response.body).to eq '{"type":"collection","total":0,"entry":[]}'
    end

    it 'returns a JSON FHIR Bundle for a single item' do
      @things = [ BundleTest.new('testing 1', 'expert') ]
      render template: 'fhir/fhir_base/index', formats: :json
      expect(response.body).to eq '{"type":"collection","total":1,"entry":[{"status":"match","resource":{"resourceType":"BundleTest","name":"testing 1","category":"expert"}}]}'
    end

    it 'returns a JSON FHIR Bundle for a multiple items' do
      @things = [ BundleTest.new('testing 1', 'expert'),
                  BundleTest.new('testing 2', 'poser') ]
      render template: 'fhir/fhir_base/index', formats: :json
      expect(response.body).to eq '{"type":"collection","total":2,"entry":[{"status":"match","resource":{"resourceType":"BundleTest","name":"testing 1","category":"expert"}},{"status":"match","resource":{"resourceType":"BundleTest","name":"testing 2","category":"poser"}}]}'
    end
  end
end