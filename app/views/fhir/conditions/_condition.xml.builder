condition.to_xml(nil,xml)
# resource.identifier.each do |identifier|
#   xml.identifier {|xml| xml << render('fhir/base/identifier', {identifier: identifier})}
# end unless resource.identifier.nil?
#
# xml.patient{ |xml| xml << render('fhir/base/reference', {reference: resource.patient})} unless resource.patient.nil?
# xml.encounter{ |xml| xml << render('fhir/base/reference', {reference: resource.encounter})} unless resource.encounter.nil?
# xml.dateRecorded({value: resource.date_recorded}) unless resource.date_recorded.nil?
# xml.code{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.code})} unless resource.code.nil?
# xml.category{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.category})} unless resource.category.nil?
# xml.clinicalStatus({value: resource.clinical_status}) unless resource.clinical_status.nil?
# xml.verificationStatus({value: resource.verification_status}) unless resource.verification_status.nil?
# xml.severity{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.severity})} unless resource.severity.nil?
# xml.onsetDatetime({value: resource.onset_datetime}) unless resource.onset_datetime.nil?
# xml.onsetAge{ |xml| xml << render('fhir/base/quantity', {quantity: resource.onset_age})} unless resource.onset_age.nil?
# xml.abatementDatetime({value: resource.abatement_datetime}) unless resource.abatement_datetime.nil?
# xml.abatementAge{ |xml| xml << render('fhir/base/quantity', {quantity: resource.abatement_age})} unless resource.abatement_age.nil?
# xml.abatementBoolean({value: resource.abatement_boolean}) unless resource.abatement_boolean.nil?
# xml.stage{ |xml| xml << render('stage', {stage: resource.stage})} unless resource.stage.nil?
#
# resource.evidence.each do |evidence|
#   xml.evidence { |xml| xml << render('evidence', {evidence: evidence})}
# end unless resource.evidence.nil?
#
# resource.body_site.each do |bodySite|
#   xml.identifier {|xml| xml << render('fhir/base/codeable_concept', {codeable_concept: bodySite})}
# end unless resource.body_site.nil?
#
# xml.notes({value: resource.notes}) unless resource.notes.nil?
