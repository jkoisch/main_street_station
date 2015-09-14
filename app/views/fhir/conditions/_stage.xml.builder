xml.summary{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: stage.summary})} unless stage.summary.nil?

stage.assessment.each do |assessment|
  xml.assessment { |xml| xml << render( 'fhir/base/reference', {reference: assessment})}
end unless stage.assessment.nil?
