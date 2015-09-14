qualification.identifier.each do |telecom|
  xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless qualification.identifier.nil?

xml.code { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: qualification.code)} unless qualification.code.nil?
xml.period { |xml| xml << render('fhir/base/period', period: qualification.period)} unless qualification.period.nil?
xml.issuer { |xml| xml << render('fhir/base/reference', reference: issuer)} unless qualification.issuer.nil?
