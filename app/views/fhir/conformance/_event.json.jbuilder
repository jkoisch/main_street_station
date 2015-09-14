json.code do
  json.partial! 'fhir/base/coding', coding: event.code.severity
end unless event.code.nil?

json.category event.category unless event.category.nil?
json.mode event.mode unless event.mode.nil?

json.focus  event.focus unless event.focus.nil?

json.request do
  json.partial! 'fhir/base/reference', reference: event.request
end unless event.request.nil?

json.response do
  json.partial! 'fhir/base/reference', reference: event.response
end unless event.response.nil?

json.documentation  event.documentation unless event.documentation.nil?

