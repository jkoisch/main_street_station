json.resourceType 'Bundle'
json.type 'Observation list'
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @observations.length
json.entry @observations do |observation|
  json.title 'YouCentric FHIR Observation'
  json.id "http://mainstreet.youcentric.com/fhir/Observation/#{observation.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'observation', resource: observation
  end
end
