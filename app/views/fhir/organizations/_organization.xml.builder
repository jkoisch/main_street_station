xml.tag!('Organization', xmlns: 'http://hl7.org/fhir') {
  xml.id({value: organization.id})
  organization.identifier.each do |identifier|
    xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: identifier})}
  end unless organization.identifier.nil?

  xml.active({value: organization.active}) unless organization.active.nil?

  xml.type { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: organization.type})} unless organization.type.nil?

  xml.name({value: organization.name}) unless organization.name.nil?

  organization.telecom.each do |telecom|
    xml.telecom {|xml| xml << render('fhir/base/contact_point', {contact_point: telecom})}
  end unless organization.telecom.nil?

  organization.address.each do |address|
    xml.address {|xml| xml << render('fhir/base/address', {address: address})}
  end unless organization.address.nil?

  xml.partOf { |xml| xml << render('fhir/base/reference', {reference: organization.part_of})} unless organization.part_of.nil?

  organization.contact.each do |contact|
    xml.contact {|xml| xml << render('contact', {contact: contact})}
  end unless organization.contact.nil?
}