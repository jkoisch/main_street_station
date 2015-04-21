xml.managingOrganization{ |xml| xml << render('fhir/base/resource_reference', resource_reference: practitioner_role.managing_organization)} unless practitioner_role.managing_organization.nil?
xml.role{ |xml| xml << render('fhir/base/codeable_concept', codeable_concept: practitioner_role.role)} unless practitioner_role.role.nil?

practitioner_role.specialty.each do |specialty|
  xml.specialty { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: specialty})}
end unless practitioner_role.specialty.nil?

xml.period{ |xml| xml << render('fhir/base/period', period: practitioner_role.period)} unless practitioner_role.period.nil?

practitioner_role.location.each do |location|
  xml.location { |xml| xml << render('fhir/base/resource_reference', {resource_reference: location})}
end unless practitioner_role.location.nil?

practitioner_role.healthcare_service.each do |service|
  xml.healthcareService { |xml| xml << render('fhir/base/resource_reference', {resource_reference: service})}
end unless practitioner_role.healthcare_service.nil?