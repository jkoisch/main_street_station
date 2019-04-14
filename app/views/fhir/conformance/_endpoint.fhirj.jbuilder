json.protocol do
  json.partial! 'fhir/base/coding', coding: endpoint.protocol.severity
end unless endpoint.protocol.nil?

json.address  endpoint.address unless endpoint.address.nil?