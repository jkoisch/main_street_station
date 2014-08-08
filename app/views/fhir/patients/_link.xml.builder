xml.other { |xml| xml << render('fhir/base/resource_reference', {resource_reference: link.other})} unless link.other.nil?
xml.type({value: link.type}) unless link.type.nil?
