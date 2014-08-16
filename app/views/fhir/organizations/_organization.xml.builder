xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: resource.identifier})} unless resource.identifier.nil?
xml.name({value: resource.name}) unless resource.name.nil?
xml.type { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.type})} unless resource.type.nil?

resource.telecom.each do |telecom|
  xml.telecom {|xml| xml << render('fhir/base/contact', {contact: telecom})}
end unless resource.telecom.nil?

resource.address.each do |address|
  xml.address {|xml| xml << render('fhir/base/address', {address: address})}
end unless resource.address.nil?

xml.partOf { |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.part_of})} unless resource.part_of.nil?

resource.contact.each do |contact|
  xml.contact {|xml| xml << render('contact', {contact: contact})}
end unless resource.contact.nil?

resource.location.each do |location|
  xml.location {|xml| xml << render('fhir/base/resource_reference', {resource_reference: location})}
end unless resource.location.nil?

xml.active({value: resource.active}) unless resource.active.nil?