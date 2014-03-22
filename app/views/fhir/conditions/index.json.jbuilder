json.resourceType 'Bundle'
json.type 'Condition list'
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @conditions.length
json.entry @conditions do |condition|
  json.title 'YouCentric FHIR Condition'
  json.id "http://mainstreet.youcentric.com/fhir/Condition/#{condition.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'condition', resource: condition
  end
end