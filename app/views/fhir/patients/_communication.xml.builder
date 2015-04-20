communication.language.each do |language|
  xml.language { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: language})}
end unless communication.language.nil?