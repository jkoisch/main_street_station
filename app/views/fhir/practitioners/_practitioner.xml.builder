resource.identifier.each do |identifier|
  xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.name{ |xml| xml << render('fhir/base/human_name', human_name: resource.name)} unless resource.name.nil?

resource.telecom.each do |telecom|
  xml.telecom { |xml| xml << render('fhir/base/contact_point', {contact_point: telecom})}
end unless resource.telecom.nil?

resource.address.each do |address|
  xml.address { |xml| xml << render('fhir/base/address', {address: address})}
end unless resource.address.nil?

xml.gender({value: resource.gender}) unless resource.gender.nil?
xml.birthDate({value: resource.birth_date}) unless resource.birth_date.nil?

resource.practitioner_role.each do |role|
  xml.practitioner_role{ |xml| xml << render('practitioner_role', {practitioner_role: role})}
end unless resource.practitioner_role.nil?

resource.qualification.each do |qualification|
  xml.qualification { |xml| xml << render('qualification', {qualification: qualification})}
end unless resource.qualification.nil?

resource.communication.each do |communication|
  xml.communication { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: communication})}
end unless resource.communication.nil?