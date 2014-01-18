xml.identifier({value: resource.identifier})
xml.version({value: resource.version}) if resource.version
xml.name({value: resource.name}) if resource.name
xml.publisher({value: resource.publisher}) if resource.publisher
resource.telecom.each do |contact|
  xml.telecom { |xml| xml << render('fhir/base/contact', {contact: contact}) }
end if resource.telecom
xml.description({value: resource.description}) if resource.description
xml.status({value: resource.status}) if resource.status
xml.experimental({value: resource.experimental}) if resource.experimental
xml.date({value: resource.date}) if resource.date
xml.software { |xml| xml << render('software', {software: resource.software}) } if resource.software
xml.implementation { |xml| xml << render('implementation', {implementation: resource.implementation}) } if resource.implementation
xml.fhirVersion({value: resource.fhir_version}) if resource.fhir_version
xml.acceptUnknown({value: resource.accept_unknown}) if resource.accept_unknown
resource.format.each do |format|
  xml.format({value: format})
end
#TODO: Need Profile resource reference
resource.rest.each do |rest|
  xml.rest { |xml| xml << render('rest', {rest: rest})}
end if resource.rest
# TODO: look to add Messaging
# TODO: look to add Document