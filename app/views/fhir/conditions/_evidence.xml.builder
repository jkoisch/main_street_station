xml.code { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: evidence.code})} unless evidence.code.nil?

evidence.detail.each do |detail|
  xml.detail { |xml| xml << render('fhir/base/reference', {reference: detail})}
end unless evidence.detail.nil?