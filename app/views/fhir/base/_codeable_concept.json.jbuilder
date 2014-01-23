json.coding codeable_concept.coding do |coding|
  json.partial! 'fhir/base/coding', coding: coding
end unless codeable_concept.coding.nil?

json.text   codeable_concept.text unless codeable_concept.text.nil?
