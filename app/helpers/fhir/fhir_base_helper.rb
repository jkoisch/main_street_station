module Fhir::FhirBaseHelper
  def json_bundle(json, resource_list=[])
    json.type 'collection'
    json.total resource_list.count
    json.entry resource_list do |resource|
      json.status 'match'
      json.resource do
        json.partial! resource.to_partial_path, resource: resource
        end
    end
  end
end