xml.use({value: identifier.use}) unless identifier.use.nil?
xml.type{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: identifier.type})} unless identifier.type.nil?
xml.system({value: identifier.system}) unless identifier.system.nil?
xml.value({value: identifier.value.to_s}) unless identifier.value.to_s.nil?
xml.period { |xml| xml << render('fhir/base/period', {period: identifier.period})} unless identifier.period.nil?
xml.assigner { |xml| xml << render('fhir/base/reference', {reference: identifier.assigner})} unless identifier.assigner.nil?
