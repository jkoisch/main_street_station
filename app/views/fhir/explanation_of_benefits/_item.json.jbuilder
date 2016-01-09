json.sequence item.sequence unless item.sequence.nil?

json.type do
  json.partial! 'fhir/base/coding', coding: item.type
end unless item.type.nil?

json.provider do
  json.partial! 'fhir/base/reference', reference: item.provider
end unless item.provider.nil?

json.diagnosisLinkId item.diagnosis_link_id do |diagnosis_link_id|
  diagnosis_link_id
end unless item.diagnosis_link_id.nil?

json.service do
  json.partial! 'fhir/base/coding', coding: item.service
end unless item.service.nil?

json.servicedDate item.serviced_date unless item.serviced_date.nil?

json.servicedPeriod do
  json.partial! 'fhir/base/period', period: item.serviced_period
end unless item.serviced_period.nil?

json.place do
  json.partial! 'fhir/base/coding', coding: item.place
end unless item.place.nil?

json.quantity do
  json.partial! 'fhir/base/quantity', quantity: item.quantity
end unless item.quantity.nil?

json.unitPrice do
  json.partial! 'fhir/base/quantity', quantity: item.unit_price
end unless item.unit_price.nil?

json.factor item.factor unless item.factor.nil?
json.points item.points unless item.points.nil?

json.net do
  json.partial! 'fhir/base/quantity', quantity: item.net
end unless item.net.nil?

json.udi do
  json.partial! 'fhir/base/coding', coding: item.udi
end unless item.udi.nil?

json.bodySite do
  json.partial! 'fhir/base/coding', coding: item.body_site
end unless item.body_site.nil?

json.subSite item.sub_site do |sub_site|
  json.partial! 'fhir/base/coding', coding: sub_site
end unless item.sub_site.nil?

json.modifier item.modifier do |modifier|
  json.partial! 'fhir/base/coding', coding: modifier
end unless item.modifier.nil?

json.adjudication item.adjudication do |adjudication|
  json.partial! 'items/adjudication', adjudication: adjudication
end unless item.adjudication.nil?