resource.identifier.each do |identifier|
  xml.identifier {|xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.subject{ |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.subject})} unless resource.subject.nil?
xml.encounter{ |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.encounter})} unless resource.encounter.nil?
xml.dateAsserted({value: resource.date_asserted}) unless resource.date_asserted.nil?
xml.code{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.code})} unless resource.code.nil?
xml.category{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.category})} unless resource.category.nil?
xml.status({value: resource.status}) unless resource.status.nil?
xml.certainty{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.certainty})} unless resource.certainty.nil?
xml.severity{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.severity})} unless resource.severity.nil?
xml.onsetDate({value: resource.onset_date}) unless resource.onset_date.nil?
xml.onsetAge{ |xml| xml << render('fhir/base/quantity', {quantity: resource.onset_age})} unless resource.onset_age.nil?
xml.abatementDate({value: resource.abatement_date}) unless resource.abatement_date.nil?
xml.abatementAge{ |xml| xml << render('fhir/base/quantity', {quantity: resource.abatement_age})} unless resource.abatement_age.nil?
xml.abatementBoolean({value: resource.abatement_boolean}) unless resource.abatement_boolean.nil?
xml.stage{ |xml| xml << render('stage', {stage: resource.stage})} unless resource.stage.nil?

resource.evidence.each do |evidence|
  xml.evidence { |xml| xml << render('evidence', {evidence: evidence})}
end unless resource.evidence.nil?

resource.location.each do |location|
  xml.location { |xml| xml << render('location', {location: location})}
end unless resource.location.nil?

resource.due_to.each do |dueTo|
  xml.dueTo { |xml| xml << render('due_to', {location: dueTo})}
end unless resource.due_to.nil?

resource.occurred_following.each do |occurredFollowing|
  xml.occurredFollowing { |xml| xml << render('occurred_following', {occurred_following: occurredFollowing})}
end unless resource.occurred_following.nil?

xml.notes({value: resource.notes}) unless resource.notes.nil?
