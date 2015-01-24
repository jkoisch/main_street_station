xml.name {|xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.name)} unless resource.name.nil?
xml.valueQuantity({value: resource.value_quantity}) unless resource.value_quantity.nil?
xml.valueCodeableConcept { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.value_codeable_concept)} unless resource.value_codeable_concept.nil?
xml.valueAttachment { |xml| xml << render('fhir/base/attachment', attachment: resource.value_attachment)} unless resource.value_attachment.nil?
xml.valueRatio{ |xml| xml << render('fhir/base/ratio', ratio: resource.value_ratio)} unless resource.value_ratio.nil?
xml.valueDateTime({value: resource.value_date_time}) unless resource.value_date_time.nil?
xml.valuePeriod{ |xml| xml << render('fhir/base/period', period: resource.value_period)} unless resource.value_period.nil?
xml.valueSampledData{ |xml| xml << render('fhir/base/sampled_data', sampled_data: resource.value_sampled_data)} unless resource.value_sampled_data.nil?
xml.valueString({value: resource.value_string}) unless resource.value_string.nil?
xml.valueTime({value: resource.value_time}) unless resource.value_time.nil?
xml.dataAbsentReason({value: resource.data_absent_reason}) unless resource.data_absent_reason.nil?
xml.interpretation { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.interpretation)} unless resource.interpretation.nil?
xml.comments({value: resource.comments}) unless resource.comments.nil?
xml.appliesDatetime({value: resource.applies_date}) unless resource.applies_date.nil?
xml.appliesPeriod{ |xml| xml << render('fhir/base/period', period: resource.applies_period)} unless resource.applies_period.nil?
xml.issued({value: resource.issued}) unless resource.issued.nil?
xml.status({value: resource.status}) unless resource.status.nil?
xml.reliability({value: resource.reliability}) unless resource.reliability.nil?
xml.bodySite { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.body_site)} unless resource.body_site.nil?
xml.tag!('method'){ |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.method)} unless resource.method.nil?
xml.identifier { |xml| xml << render('fhir/base/identifier', identifier: resource.identifier)} unless resource.identifier.nil?
xml.subject { |xml| xml << render('fhir/base/resource_reference', resource_reference: resource.subject)} unless resource.subject.nil?
xml.specimen { |xml| xml << render('fhir/base/resource_reference', resource_reference: resource.specimen)} unless resource.specimen.nil?

resource.performer.each do |performer|
  xml.performer { |xml| xml << render('fhir/base/resource_reference', {resource_reference: performer})}
end unless resource.performer.nil?

xml.encounter{ |xml| xml << render('fhir/base/encounter', encounter: resource.encounter)} unless resource.encounter.nil?

resource.reference_range.each do |reference_range|
  xml.referenceRange { |xml| xml << render('reference_range', {reference_range: reference_range})}
end unless resource.reference_range.nil?

resource.related.each do |related|
  xml.related { |xml| xml << render('related', {related: related})}
end unless resource.related.nil?