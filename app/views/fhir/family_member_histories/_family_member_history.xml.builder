xml.tag!('FamilyMemberHistory', xmlns: 'http://hl7.org/fhir') do
  resource.identifier.each do |identifier|
    xml.identifier {|xml| xml << render('fhir/base/identifier', {identifier: identifier})}
  end unless resource.identifier.nil?

  xml.patient { |xml| xml << render('fhir/base/reference', {reference: resource.patient})} unless resource.patient.nil?
  xml.date({value: resource.date}) unless resource.date.nil?
  xml.status({value: resource.status}) unless resource.status.nil?
  xml.name({value: resource.name}) unless resource.name.nil?
  xml.relationship { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.relationship})} unless resource.relationship.nil?
  xml.gender({value: resource.gender}) unless resource.gender.nil?

  xml.bornPeriod { |xml| xml << render('fhir/base/period', {period: resource.born_period})} unless resource.born_period.nil?
  xml.bornDate({value: resource.born_date}) unless resource.born_date.nil?
  xml.bornString({value: resource.born_string}) unless resource.born_string.nil?

  xml.ageAge { |xml| xml << render('fhir/base/age', {age: resource.age_age})} unless resource.age_age.nil?
  xml.ageRange { |xml| xml << render('fhir/base/range', {range: resource.age_range})} unless resource.age_range.nil?
  xml.ageString({value: resource.age_string}) unless resource.age_string.nil?

  xml.deceasedBoolean({value: resource.deceased_boolean}) unless resource.deceased_boolean.nil?
  xml.deceasedAge { |xml| xml << render('fhir/base/quantity', {quantity: resource.deceased_age}) } unless resource.deceased_age.nil?
  xml.deceasedRange{ |xml| xml << render('fhir/base/range', {range: resource.deceased_range})} unless resource.deceased_range.nil?
  xml.deceasedDate({value: resource.deceased_date}) unless resource.deceased_date.nil?
  xml.deceasedString({value: resource.deceased_string}) unless resource.deceased_string.nil?

  xml.note { |xml| xml << render('fhir/base/annotation', {annotation: resource.note})} unless resource.note.nil?

  resource.condition.each do |condition|
    xml.condition {|xml| xml << render('condition', {condition: condition})}
  end unless resource.condition.nil?
end