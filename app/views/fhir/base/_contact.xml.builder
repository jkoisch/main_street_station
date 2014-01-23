xml.system({value: contact.system}) unless contact.system.nil?
xml.value({value: contact.value}) unless contact.value.nil?
xml.use({value: contact.use}) unless contact.use.nil?
xml.period { |xml| xml << render('fhir/base/period', {period: contact.period}) } unless contact.period.nil?