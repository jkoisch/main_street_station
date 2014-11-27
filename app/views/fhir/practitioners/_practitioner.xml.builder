resource.identifier.each do |identifier|
  xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.name{ |xml| xml << render('fhir/base/human_name', human_name: resource.name)} unless resource.name.nil?

resource.telecom.each do |telecom|
  xml.telecom { |xml| xml << render('fhir/base/contact', {contact: telecom})}
end unless resource.telecom.nil?

xml.address { |xml| xml << render('fhir/base/address', address: resource.address)} unless resource.address.nil?
xml.gender { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.gender)} unless resource.gender.nil?
xml.birthDate({value: resource.birth_date}) unless resource.birth_date.nil?

resource.organization.each do |org|
  xml.organization { |xml| xml << render('fhir/base/resource_reference', resource_reference: org) }
end unless resource.organization.nil?

#xml.organization { |xml| xml << render('fhir/base/resource_reference', resource_reference: resource.organization)} unless resource.organization.nil?

resource.role.each do |role|
  xml.role{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: role})}
end unless resource.role.nil?

resource.specialty.each do |specialty|
  xml.specialty{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: specialty})}
end unless resource.specialty.nil?

xml.period { |xml| xml << render('fhir/base/period', period: resource.period)} unless resource.period.nil?

resource.location.each do |location|
  xml.location { |xml| xml << render('fhir/base/resource_reference', {location: location})}
end unless resource.location.nil?

resource.qualification.each do |qualification|
  xml.qualification { |xml| xml << render('qualification', {qualification: qualification})}
end unless resource.qualification.nil?

resource.communication.each do |communication|
  xml.communication { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: communication})}
end unless resource.communication.nil?