json.resourceType 'Bundle'
json.type 'FamilyHistory list'
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @family_histories.length
json.entry @family_histories do |family_history|
  json.title 'YouCentric FHIR FamilyHistory'
  json.id "http://mainstreet.youcentric.com/fhir/FamilyHistory/#{family_history.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'family_history', resource: family_history
  end
end