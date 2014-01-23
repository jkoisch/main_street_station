json.cors   security.cors unless security.cors.nil?

json.security security.service do |service|
  json.partial! 'fhir/base/codeable_concept', service: service
end unless security.service.nil?

json.description  security.description unless security.description.nil?

json.certificate security.certificate do |certificate|
  json.partial! 'certificate', certificate: certificate
end unless security.certificate.nil?
