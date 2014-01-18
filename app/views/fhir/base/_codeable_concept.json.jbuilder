if codeable_concept.coding
  json.coding do
    json.partial! 'fhir/base/coding', coding: codeable_concept.coding
  end
end
json.text   codeable_concept.text if codeable_concept.text