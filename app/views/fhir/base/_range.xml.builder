xml.low { |xml| xml << render('fhir/base/quantity', {low: range.low}) } if range.low
xml.high { |xml| xml << render('fhir/base/quantity', {high: range.high}) } if range.high