xml.url({value: resource.url}) unless resource.url.nil?
xml.version({value: resource.version}) unless resource.version.nil?
xml.name({value: resource.name}) unless resource.name.nil?
xml.publisher({value: resource.publisher}) unless resource.publisher.nil?
resource.contact.each do |contact|
  xml.contact { |xml| xml << render('contact', {contact: contact}) }
end unless resource.contact.nil?
xml.description({value: resource.description}) unless resource.description.nil?
xml.requirements({value: resource.requirements}) unless resource.requirements.nil?
xml.copyright({value: resource.copyright}) unless resource.copyright.nil?
xml.status({value: resource.status}) unless resource.status.nil?
xml.experimental({value: resource.experimental}) unless resource.experimental.nil?
xml.date({value: resource.date}) unless resource.date.nil?
xml.software { |xml| xml << render('software', {software: resource.software}) } unless resource.software.nil?
xml.implementation { |xml| xml << render('implementation', {implementation: resource.implementation}) } unless resource.implementation.nil?
resource.profile.each do |profile|
  xml.profile { |xml| xml << render('fhir/base/resource_reference', {resource_reference: profile})}
end unless resource.profile.nil?
resource.rest.each do |rest|
  xml.rest { |xml| xml << render('rest', {rest: rest})}
end unless resource.rest.nil?
resource.messaging.each do |messaging|
  xml.messaging { |xml| xml << render('messaging', {messaging: messaging})}
end unless resource.messaging.nil?
resource.document.each do |document|
  xml.document { |xml| xml << render('document', {document: document})}
end unless resource.document.nil?
