json.sequence detail.sequence unless detail.sequence.nil?

json.type do
  json.partial! 'fhir/base/coding', coding: item_detail.type
end unless item_detail.type.nil?

json.service do
  json.partial! 'fhir/base/coding', coding: item_detail.service
end unless item_detail.service.nil?

json.quantity do
  json.partial! 'fhir/base/quantity', quantity: item_detail.quantity
end unless item_detail.quantity.nil?

json.unitPrice do
  json.partial! 'fhir/base/quantity', quantity: item_detail.unit_price
end unless item_detail.unit_price.nil?

json.factor item_detail.factor unless item_detail.factor.nil?
json.points item_detail.points unless item_detail.points.nil?

json.net do
  json.partial! 'fhir/base/quantity', quantity: item_detail.net
end unless item_detail.net.nil?

json.udi do
  json.partial! 'fhir/base/coding', coding: item_detail.udi
end unless item_detail.udi.nil?

json.adjudication item_detail.adjudication do |adjudication|
  json.partial! 'fhir/explanation_of_benefits/adjudication', adjudication: adjudication
end unless item_detail.adjudication.nil?

json.subDetail item_detail.sub_detail do |sub_detail|
  json.partial! 'sub_detail', sub_detail: sub_detail
end unless item_detail.sub_detail.nil?