json.resourceType 'Bundle'
json.type 'Conformance list'
json.updated DateTime.now
json.id 'fake-id'
json.totalResults @conformances.length
json.entry @conformances do |conformance|
  json.title 'YouCentric FHIR Conformance'
  json.id 'http://mainstreet.youcentric.com/fhir/conformance/1'
  json.updated DateTime.now
  json.content do
    json.partial! 'conformance', resource: conformance
  end
end
