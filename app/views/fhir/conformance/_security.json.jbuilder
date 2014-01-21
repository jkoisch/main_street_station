json.cors security.cors if security.cors
json.security security.service do |service|
  json.partial! 'fhir/base/codeable_concept', service: service
end if security.service and security.service.length > 0
json.description security.description if security.description
json.certificate security.certificate do |certificate|
  json.partial! 'certificate', certificate: certificate
end if security.certificate and security.certificate.length > 0
