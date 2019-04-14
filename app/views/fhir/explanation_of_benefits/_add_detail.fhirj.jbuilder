json.service do
  json.partial! 'fhir/base/coding', coding: add_detail.service
end unless add_detail.service.nil?

json.fee do
  json.partial! 'fhir/base/quantity', quantity: add_detail.fee
end unless add_detail.fee.nil?

json.adjudication add_detail.adjudication do |adjudication|
  json.partial! 'fhir/explanation_of_benefits/adjudication', adjudication: adjudication
end unless add_detail.adjudication.nil?