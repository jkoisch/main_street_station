resource.identifier.each do |identifier|
  xml.identifier {|xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

resource.name.each do |name|
  xml.name {|xml| xml << render('fhir/base/human_name', {human_name: name})}
end unless resource.name.nil?

resource.telecom.each do |telecom|
  xml.telecom {|xml| xml << render('fhir/base/contact', {contact: telecom})}
end unless resource.telecom.nil?

xml.gender { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.gender})} unless resource.gender.nil?
xml.birthDate({value: resource.birth_date}) unless resource.birth_date.nil?
xml.deceasedBoolean({value: resource.deceased_boolean}) unless resource.deceased_boolean.nil?
xml.deceasedDatetime({value: resource.deceased_datetime}) unless resource.deceased_datetime.nil?

resource.address.each do |address|
  xml.address {|xml| xml << render('fhir/base/address', {address: address})}
end unless resource.address.nil?

xml.maritalStatus { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.marital_status})} unless resource.marital_status.nil?
xml.multipleBirthBoolean({value: resource.multiple_birth_boolean}) unless resource.multiple_birth_boolean.nil?
xml.multipleBirthInteger({value: resource.multiple_birth_integer}) unless resource.multiple_birth_integer.nil?

resource.contact.each do |contact|
  xml.contact { |xml| xml << render('contact', {contact: contact})}
end unless resource.contact.nil?

xml.communication { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.communication})} unless resource.communication.nil? or resource.communication.blank?
xml.active({value: resource.active}) unless resource.active.nil?

xml