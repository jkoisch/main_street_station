json.resourceType 'Bundle'
json.type 'Organization list'
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @organizations.length
json.entry @organizations do |organization|
  json.title 'YouCentric FHIR Organization'
  json.id "http://mainstreet.youcentric.com/fhir/Organization/#{organization.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'organization', resource: organization
  end
end