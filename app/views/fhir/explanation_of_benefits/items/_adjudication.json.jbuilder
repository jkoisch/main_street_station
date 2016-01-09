json.category do
  json.partial! 'fhir/base/coding', coding: adjudication.category
end unless adjudication.category.nil?

json.reason do
  json.partial! 'fhir/base/coding', coding: adjudication.reason
end unless adjudication.reason.nil?

json.amount do
  json.partial! 'fhir/base/quantity', quantity: adjudication.amount
end unless adjudication.amount.nil?

json.value adjudication.value unless adjudication.value.nil?