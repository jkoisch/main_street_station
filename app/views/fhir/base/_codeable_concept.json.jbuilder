json.coding codeable_concept.coding do |coding|
  json.partial! 'fhir/base/coding', coding: coding
end if codeable_concept.coding and codeable_concept.coding.length > 0

json.text   codeable_concept.text if codeable_concept.text
