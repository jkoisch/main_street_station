resource.identifier.each do |identifier|
  xml.identifier { |xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.type { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.type})} unless resource.type.nil?
xml.manufacturer({value: resource.manufacturer}) unless resource.manufacturer.nil?
xml.model({value: resource.model}) unless resource.model.nil?
xml.version({value: resource.version}) unless resource.version.nil?
xml.expiry({value: resource.expiry}) unless resource.expiry.nil?
xml.udi({value: resource.udi}) unless resource.udi.nil?
xml.lotNumber({value: resource.lot_number}) unless resource.lot_number.nil?

resource.contact.each do |contact|
  xml.contact { |xml| xml << render('fhir/base/contact', {contact: contact})}
end unless resource.contact.nil?

xml.url({value: resource.url}) unless resource.url.nil?