xml.code {|xml| xml << render('fhir/base/codeable_concept', codeable_concept: component.code)} unless component.code.nil?
xml.valueQuantity({value: component.value_quantity}) unless component.value_quantity.nil?
xml.valueCodeableConcept { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: component.value_codeable_concept)} unless component.value_codeable_concept.nil?
xml.valueString({value: component.value_string}) unless component.value_string.nil?
xml.valueRange{ |xml| xml << render('fhir/base/range', range: component.value_range)} unless component.value_range.nil?
xml.valueRatio{ |xml| xml << render('fhir/base/ratio', ratio: component.value_ratio)} unless component.value_ratio.nil?
xml.valueSampledData{ |xml| xml << render('fhir/base/sampled_data', sampled_data: component.value_sampled_data)} unless component.value_sampled_data.nil?
xml.valueAttachment { |xml| xml << render('fhir/base/attachment', attachment: component.value_attachment)} unless component.value_attachment.nil?
xml.valueTime({value: component.value_time}) unless component.value_time.nil?
xml.valueDateTime({value: component.value_datetime}) unless component.value_datetime.nil?
xml.valuePeriod{ |xml| xml << render('fhir/base/period', period: component.value_period)} unless component.value_period.nil?
xml.dataAbsentReason { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: component.data_absent_reason)} unless component.data_absent_reason.nil?

component.reference_range.each do |reference_range|
  xml.referenceRange { |xml| xml << render('reference_range', {reference_range: reference_range})}
end unless component.reference_range.nil?