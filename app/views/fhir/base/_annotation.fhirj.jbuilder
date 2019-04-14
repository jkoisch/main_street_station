json.authorReference do
  json.partial! 'fhir/base/reference', reference: annotation.author_reference
end unless annotation.author_reference.nil?

json.authorString annotation.author_string unless annotation.author_string.nil?

json.time     annotation.time unless annotation.time.nil?
json.text     annotation.text unless annotation.text.nil?