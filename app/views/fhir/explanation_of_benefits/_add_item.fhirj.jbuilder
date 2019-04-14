json.sequenceLinkId add_item.sequence_link_id unless add_item.sequence_link_id.nil?

json.service do
  json.partial! 'fhir/base/coding', coding: add_item.service
end unless add_item.service.nil?

json.fee do
  json.partial! 'fhir/base/quantity', quantity: add_item.fee
end unless add_item.fee.nil?

json.noteNumberLinkId add_item.note_number_link_id unless add_item.note_number_link_id.nil?

json.adjudication add_item.adjudication do |adjudication|
  json.partial! 'fhir/explanation_of_benefits/adjudication', adjudication: adjudication
end unless add_item.adjudication.nil?

json.detail add_item.detail do |detail|
  json.partial! 'fhir/explanation_of_benefits/add_detail', add_detail: detail
end unless add_item.detail.nil?