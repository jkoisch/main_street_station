xml.other { |xml| xml << render('fhir/base/reference', {reference: link.other})} unless link.other.nil?
xml.type({value: link.type}) unless link.type.nil?
