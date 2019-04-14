json.type do
  json.partial! 'fhir/base/coding', coding: payee.type
end unless payee.type.nil?

json.provider do
  json.partial! 'fhir/base/reference', reference: payee.provider
end unless payee.provider.nil?

json.organization do
  json.partial! 'fhir/base/reference', reference: payee.organization
end unless payee.organization.nil?

json.person do
  json.partial! 'fhir/base/reference', reference: payee.person
end unless payee.person.nil?