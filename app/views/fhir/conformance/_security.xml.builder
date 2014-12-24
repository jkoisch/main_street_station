xml.cors({value: security.cors}) unless security.cors.nil?

security.service.each do |service|
  xml.service { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: service}) }
end unless security.service.nil?

xml.description({value: security.description}) unless security.description.nil?

security.certificate.each do |certificate|
  xml.certificate { |xml| xml << render('certificate', {certificate: certificate})}
end unless security.certificate.nil?
