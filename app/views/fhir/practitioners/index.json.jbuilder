json.resourceType 'Bundle'
json.type 'Practitioner List' # TODO: Need to update
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @practitioners.length
json.entry @practitioners do |practitioner|
  json.title 'YouCentric FHIR' # TODO: This needs actual values
  json.id "http://mainstreet.youcentric.com/fhir/Practitioner/#{practitioner.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'practitioner', resource: practitioner
  end
end
