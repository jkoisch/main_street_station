xml.use({value: identifier.use}) unless identifier.use.nil?
xml.label({value: identifier.label}) unless identifier.label.nil?
xml.system({value: identifier.system}) unless identifier.system.nil?
xml.value({value: identifier.value.to_s}) unless identifier.value.to_s.nil?
xml.period { |xml| xml << render('fhir/base/period', {period: identifier.period})} unless identifier.period.nil?
