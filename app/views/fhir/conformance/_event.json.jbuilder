json.code event.code unless event.code.nil?
json.category event.category unless event.category.nil?
json.mode event.mode unless event.mode.nil?

json.protocol event.protocol do |protocol|
  json.partial! 'fhir/base/coding', coding: protocol
end unless event.protocol.nil?

json.focus  event.focus unless event.focus.nil?

json.request do
  json.partial! 'fhir/base/resource_reference', resource_reference: event.request
end unless event.request.nil?

json.response do
  json.partial! 'fhir/base/resource_reference', resource_reference: event.response
end unless event.response.nil?

json.documentation  event.documentation unless event.documentation.nil?

