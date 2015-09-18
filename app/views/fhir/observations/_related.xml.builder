xml.type({value: related.type}) unless related.type.nil?
xml.target { |xml| xml << render('fhir/base/reference', {reference: related.target})} unless related.target.nil?
