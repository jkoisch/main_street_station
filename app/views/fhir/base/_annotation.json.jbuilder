json.authorReference do
  json.partial! 'fhir/base/resource_reference', resource_reference: annotation.author_resource_reference
end unless annotation.author_resource_reference.nil?

json.authorString annotation.author_string unless annotation.author_string.nil?

json.time     annotation.time unless annotation.time.nil?
json.text     annotation.text unless annotation.text.nil?