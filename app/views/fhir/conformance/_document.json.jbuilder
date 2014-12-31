json.mode   document.mode unless document.mode.nil?
json.documentation  document.documentation unless document.documentation.nil?

json.profile do
   json.partial! 'fhir/base/resource_reference', resource_reference: document.profile
end unless document.profile.nil?