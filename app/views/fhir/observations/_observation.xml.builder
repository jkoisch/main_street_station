observation.to_xml(nil, xml)
# resource.identifier.each do |identifier|
#   xml.identifier { |xml| xml << render('fhir/base/identifier', identifier: identifier)}
# end unless resource.identifier.nil?
#
# xml.status({value: resource.status}) unless resource.status.nil?
# xml.category {|xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.category)} unless resource.category.nil?
# xml.code {|xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.code)} unless resource.code.nil?
# xml.subject { |xml| xml << render('fhir/base/reference', reference: resource.subject)} unless resource.subject.nil?
# xml.encounter{ |xml| xml << render('fhir/base/reference', reference: resource.encounter)} unless resource.encounter.nil?
# xml.effectiveDatetime({value: resource.effective_date}) unless resource.effective_date.nil?
# xml.effectivePeriod{ |xml| xml << render('fhir/base/period', period: resource.effective_period)} unless resource.effective_period.nil?
# xml.issued({value: resource.issued}) unless resource.issued.nil?
#
# resource.performer.each do |performer|
#   xml.performer { |xml| xml << render('fhir/base/reference', {reference: performer})}
# end unless resource.performer.nil?
#
# xml.valueQuantity({value: resource.value_quantity}) unless resource.value_quantity.nil?
# xml.valueCodeableConcept { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.value_codeable_concept)} unless resource.value_codeable_concept.nil?
# xml.valueString({value: resource.value_string}) unless resource.value_string.nil?
# xml.valueRange{ |xml| xml << render('fhir/base/range', range: resource.value_range)} unless resource.value_range.nil?
# xml.valueRatio{ |xml| xml << render('fhir/base/ratio', ratio: resource.value_ratio)} unless resource.value_ratio.nil?
# xml.valueSampledData{ |xml| xml << render('fhir/base/sampled_data', sampled_data: resource.value_sampled_data)} unless resource.value_sampled_data.nil?
# xml.valueAttachment { |xml| xml << render('fhir/base/attachment', attachment: resource.value_attachment)} unless resource.value_attachment.nil?
# xml.valueTime({value: resource.value_time}) unless resource.value_time.nil?
# xml.valueDateTime({value: resource.value_datetime}) unless resource.value_datetime.nil?
# xml.valuePeriod{ |xml| xml << render('fhir/base/period', period: resource.value_period)} unless resource.value_period.nil?
# xml.dataAbsentReason { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.data_absent_reason)} unless resource.data_absent_reason.nil?
# xml.interpretation { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.interpretation)} unless resource.interpretation.nil?
# xml.comments({value: resource.comments}) unless resource.comments.nil?
# xml.bodySite { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.body_site)} unless resource.body_site.nil?
# xml.tag!('method'){ |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.method)} unless resource.method.nil?
# xml.specimen { |xml| xml << render('fhir/base/reference', reference: resource.specimen)} unless resource.specimen.nil?
#
# xml.device{ |xml| xml << render('fhir/base/reference', reference: resource.device)} unless resource.device.nil?
#
# resource.reference_range.each do |reference_range|
#   xml.referenceRange { |xml| xml << render('reference_range', {reference_range: reference_range})}
# end unless resource.reference_range.nil?
#
# resource.related.each do |related|
#   xml.related { |xml| xml << render('related', {related: related})}
# end unless resource.related.nil?
#
# resource.component.each do |component|
#   xml.component { |xml| xml << render('component', {component: component})}
# end unless resource.component.nil?