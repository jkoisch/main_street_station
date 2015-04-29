module Fhir::FhirBaseHelper
  def json_bundle(json, resource_list=[])
    json.resourceType 'Bundle'
    json.type 'collection'
    json.total resource_list.count
    json.entry resource_list do |resource|
      json.status 'match'
      json.resource do
        json.partial! resource.to_partial_path, resource: resource
        end
    end
  end

  def xml_bundle(xml, resource_list=[])
    xml.tag!('Bundle') do
      xml.type(value: 'collection')
      xml.total(value: resource_list.count)
      resource_list.each do |resource|
        xml.entry do
          xml.status(value: 'match')
          xml.resource do
            xml << render(partial: resource.to_partial_path, locals: {resource: resource})
          end
        end
      end
    end
  end
end