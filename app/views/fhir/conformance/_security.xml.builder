xml.cors({value: security.cors}) if security.cors
security.service.each do |service|
  xml.service { |xml| xml << render('fhir/base/codeable_concept', {service: service}) }
end if security.service
xml.description({value: security.description}) if security.description
security.certificate.each do |certificate|
  xml.certificate { |xml| xml << render('certificate', {certificate: certificate})}
end if security.certificate
