json.resourceType 'Bundle'
json.type 'Questionnaire list'
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @questionnaires.length
json.entry @questionnaires do |questionnaire|
  json.title 'YouCentric FHIR Questionnaire'
  json.id "http://mainstreet.youcentric.com/fhir/Questionnaire/#{questionnaire.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'observation', resource: observation
  end
end

