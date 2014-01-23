xml.low { |xml| xml << render('fhir/base/quantity', {low: range.low}) } unless range.low.nil?
xml.high { |xml| xml << render('fhir/base/quantity', {high: range.high}) } unless range.high.nil?