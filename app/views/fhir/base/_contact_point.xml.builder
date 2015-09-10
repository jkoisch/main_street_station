xml.system({value: contact_point.system}) unless contact_point.system.nil?
xml.value({value: contact_point.value}) unless contact_point.value.nil?
xml.use({value: contact_point.use}) unless contact_point.use.nil?
xml.rank({value: contact_point.rank}) unless contact_point.rank.nil?
xml.period { |xml| xml << render('fhir/base/period', {period: contact_point.period}) } unless contact_point.period.nil?