resource.identifier.each do |identifier|
  xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end

xml.name({value: resource.name}) unless resource.name.nil?
xml.description({value: resource.description}) unless resource.description.nil?
xml.type { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.type)} unless resource.type.nil?

resource.telecom.each do |telecom|
  xml.telecom { |xml| xml << render('fhir/base/contact', {contact: telecom})}
end unless resource.telecom.nil?

xml.address { |xml| xml << render('fhir/base/address', address: resource.address)} unless resource.address.nil?
xml.physicalType { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.physical_type)} unless resource.physical_type.nil?
xml.position { |xml| xml << render('position', {position: resource.position})} unless resource.position.nil?
xml.managingOrganization { |xml| xml << render('fhir/base/resource_reference', resource_reference: resource.managing_organization)} unless resource.managing_organization.nil?
xml.status({value: resource.status}) unless resource.status.nil?
xml.partOf { |xml| xml << render('fhir/base/resource_reference', resource_reference: resource.part_of)} unless resource.part_of.nil?
xml.mode({value: resource.mode}) unless resource.mode.nil?