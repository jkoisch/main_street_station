json.siteCodeableConcept do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: location.site_codeable_concept
end unless location.site_codeable_concept.nil?

json.siteReference do
  json.partial! 'fhir/base/resource_reference', resource_reference: location.site_resource_reference
end unless location.site_resource_reference.nil?