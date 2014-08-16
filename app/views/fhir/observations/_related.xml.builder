xml.type({value: related.type}) unless related.type.nil?
xml.target { |xml| xml << render('fhir/base/resource_reference', {resource_reference: related.target})} unless related.target.nil?
