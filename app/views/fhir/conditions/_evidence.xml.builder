xml.code { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: evidence.code})} unless evidence.code.nil?

evidence.detail.each do |detail|
  xml.detail { |xml| xml << render('fhir/base/resource_reference', {resource_reference: detail})}
end unless evidence.detail.nil?