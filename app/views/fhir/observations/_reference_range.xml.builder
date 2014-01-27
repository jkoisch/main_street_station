xml.low({value: reference_range.low}) unless reference_range.low.nil?
xml.high({value: reference_range.high}) unless reference_range.high.nil?
xml.meaning { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: reference_range.meaning})} unless reference_range.meaning.nil?
xml.age { |xml| xml << render('fhir/base/period', {period: reference_range.age})} unless reference_range.age.nil?