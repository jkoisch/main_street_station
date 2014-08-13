xml.type({value: related_item.type}) unless related_item.type.nil?
xml.code{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: related_item.code})} unless related_item.code.nil?
xml.target{ |xml| xml << render('fhir/base/resource_reference', {resource_reference: related_item.target})} unless related_item.target.nil?