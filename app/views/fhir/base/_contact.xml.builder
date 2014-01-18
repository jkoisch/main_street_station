xml.system({value: contact.system}) if contact.system
xml.value({value: contact.value}) if contact.value
xml.use({value: contact.use}) if contact.use
xml.period { |xml| xml << render('fhir/base/period', {period: contact.period}) } if contact.period