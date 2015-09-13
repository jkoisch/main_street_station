resource.identifier.each do |identifier|
  xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.type { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.type})} unless resource.type.nil?

resource.note.each do |note|
  xml.note { |xml| xml << render('fhir/base/annotation', {annotation: note})}
end unless resource.note.nil?

xml.status({value: resource.status}) unless resource.status.nil?
xml.manufacturer({value: resource.manufacturer}) unless resource.manufacturer.nil?
xml.model({value: resource.model}) unless resource.model.nil?
xml.version({value: resource.version}) unless resource.version.nil?
xml.manufactureDate({value: resource.manufacture_date}) unless resource.manufacture_date.nil?
xml.expiry({value: resource.expiry}) unless resource.expiry.nil?
xml.udi({value: resource.udi}) unless resource.udi.nil?
xml.lotNumber({value: resource.lot_number}) unless resource.lot_number.nil?

xml.owner { |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.owner})} unless resource.owner.nil?
xml.location { |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.location})} unless resource.location.nil?
xml.patient { |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.patient})} unless resource.patient.nil?

resource.contact.each do |contact|
  xml.contact { |xml| xml << render('fhir/base/contact_point', {contact_point: contact})}
end unless resource.contact.nil?

xml.url({value: resource.url}) unless resource.url.nil?