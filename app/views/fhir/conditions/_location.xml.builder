xml.code{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: location.code})} unless location.code.nil?
xml.detail({value: location.detail}) unless location.detail.nil?