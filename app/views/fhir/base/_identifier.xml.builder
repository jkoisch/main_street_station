xml.use({value: identifier.use}) if identifier.use
xml.label({value: identifier.label}) if identifier.label
xml.system({value: identifier.system}) if identifier.system
xml.value({value: identifier.value}) if identifier.value
xml.period { |xml| xml << render('fhir/base/period', {period: identifier.period})} if identifier.period
#TODO: xml.assigner Resource(Organization)