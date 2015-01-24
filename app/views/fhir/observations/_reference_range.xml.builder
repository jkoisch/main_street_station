xml.low { |xml| xml << render('fhir/base/quantity', {quantity: reference_range.low})} unless reference_range.low.nil?
xml.high { |xml| xml << render('fhir/base/quantity', {quantity: reference_range.high})} unless reference_range.high.nil?
xml.meaning { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: reference_range.meaning})} unless reference_range.meaning.nil?
xml.age { |xml| xml << render('fhir/base/range', {range: reference_range.age})} unless reference_range.age.nil?
xml.text({value: reference_range.text}) unless reference_range.text.nil?
