json.resourceType 'Bundle'
json.type 'Location list'
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @locations.length
json.entry @locations do |location|
  json.title 'YouCentric FHIR Location'
  json.id "http://mainstreet.youcentric.com/fhir/Location/#{location.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'location', resource: location
  end
end
