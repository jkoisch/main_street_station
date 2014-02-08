xml.type({value: related_item.type}) unless related_item.type.nil?
xml.code{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: related_item.code})} unless related_item.code.nil?