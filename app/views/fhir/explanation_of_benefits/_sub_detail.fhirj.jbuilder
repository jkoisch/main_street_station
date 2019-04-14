json.sequence sub_detail.sequence unless sub_detail.sequence.nil?

json.type do
  json.partial! 'fhir/base/coding', coding: sub_detail.type
end unless sub_detail.type.nil?

json.service do
  json.partial! 'fhir/base/coding', coding: sub_detail.service
end unless sub_detail.service.nil?

json.quantity do
  json.partial! 'fhir/base/quantity', quantity: sub_detail.quantity
end unless sub_detail.quantity.nil?

json.unitPrice do
  json.partial! 'fhir/base/quantity', quantity: sub_detail.unit_price
end unless sub_detail.unit_price.nil?

json.factor sub_detail.factor unless sub_detail.factor.nil?
json.points sub_detail.points unless sub_detail.points.nil?

json.net do
  json.partial! 'fhir/base/quantity', quantity: sub_detail.net
end unless sub_detail.net.nil?

json.udi do
  json.partial! 'fhir/base/coding', coding: sub_detail.udi
end unless sub_detail.udi.nil?

json.adjudication sub_detail.adjudication do |adjudication|
  json.partial! 'fhir/explanation_of_benefits/adjudication', adjudication: adjudication
end unless sub_detail.adjudication.nil?