json.number note.number unless note.number.nil?

json.type do
  json.partial! 'fhir/base/coding', coding: note.type
end unless note.type.nil?

json.text note.text unless note.text.nil?