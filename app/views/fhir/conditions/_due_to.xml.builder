xml.code { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: due_to.code})} unless due_to.code.nil?
xml.target { |xml| xml << render('fhir/base/resource_reference', {resource_reference: due_to.target})}unless due_to.target.nil?