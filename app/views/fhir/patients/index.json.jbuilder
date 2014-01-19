json.resourceType 'Bundle'
json.type 'Patient List' # TODO: Need to update
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @patients.length
json.entry @patients do |patient|
  json.title 'YouCentric FHIR' # TODO: This needs actual values
  json.id "http://mainstreet.youcentric.com/fhir/Patient/#{patient.id}"
  json.updated DateTime.now
  json.content do
    json.resourceType 'Patient'
    json.partial! 'patient', resource: patient
  end
end
