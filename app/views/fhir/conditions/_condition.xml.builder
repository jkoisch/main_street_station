resource.identifier.each do |identifier|
  xml.identifier {|xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.date_asserted({value: resource.date_asserted}) unless resource.date_asserted.nil?
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
xml.evidence{ |xml| xml << render('evidence', {evidence: resource.evidence})} unless resource.evidence.nil?

resource.location.each do |location|
  xml.location { |xml| xml << render('location', {location: location})}
end unless resource.location.nil?

resource.related_item.each do |related_item|
  xml.relatedItem{ |xml| xml << render('related_item', {related_item: related_item})}
end unless resource.related_item.nil?

xml.note({value: resource.note}) unless resource.note.nil?
