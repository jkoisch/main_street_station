xml.code { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: condition.code})} unless condition.code.nil?
xml.outcome { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: condition.outcome})} unless condition.outcome.nil?
xml.onsetAge{ |xml| xml << render('fhir/base/quantity', {quantity: condition.onset_age})} unless condition.onset_age.nil?
xml.onsetRange { |xml| xml << render('fhir/base/range', {range: condition.onset_range})} unless condition.onset_range.nil?
xml.onsetString({value: condition.onset_string}) unless condition.onset_string.nil?
xml.note({value: condition.note}) unless condition.note.nil?