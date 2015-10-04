module Fhir::FhirBaseHelper
  def json_bundle(json, resource_list=[])
    json.resourceType 'Bundle'
    json.meta do
      json.lastUpdated Time.now.strftime('%FT%H:%M:%SZ')
    end
    json.type 'searchset'
    json.total resource_list.count
    json.entry resource_list do |resource|
      json.fullUrl "http://mainstreet.youcentric.com/fhir/#{resource.class.name.demodulize}/#{resource.id}"
      json.resource do
        json.partial! resource.to_partial_path, resource: resource
      end
      json.search do
        json.mode 'match'
      end
    end
  end

  def xml_bundle(xml, resource_list=[])
    xml.tag!('Bundle', xmlns: 'http://hl7.org/fhir') do
      xml.meta do
        xml.lastUpdated(value: Time.now.strftime('%FT%H:%M:%SZ'))
      end
      xml.type(value: 'searchset')
      xml.total(value: resource_list.count)
      resource_list.each do |resource|
        xml.entry do
          xml.fullUrl(value: "http://mainstreet.youcentric.com/fhir/#{resource.class.name.demodulize}/#{resource.id}")
          xml.resource do
            xml << render(resource)
          end
          xml.search do
            xml.mode(value: 'match')
          end
        end
      end
    end
  end
end