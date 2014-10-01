xml.code { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: qualification.code)} unless qualification.code.nil?
xml.period { |xml| xml << render('fhir/base/period', period: qualification.period)} unless qualification.period.nil?
xml.issuer { |xml| xml << render('fhir/base/resource_reference', resource_reference: issuer)} unless qualification.issuer.nil?