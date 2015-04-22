xml.name({value: relation.name}) unless relation.name.nil?
xml.relationship{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: relation.relationship})} unless relation.relationship.nil?
xml.bornPeriod { |xml| xml << render('fhir/base/period', {period: relation.born_period})} unless relation.born_period.nil?
xml.bornDate({value: relation.born_date}) unless relation.born_date.nil?
xml.bornString({value: relation.born_string}) unless relation.born_string.nil?
xml.ageAge { |xml| xml << render('fhir/base/age', {age: relation.age_age})} unless relation.age_age.nil?
xml.ageRange { |xml| xml << render('fhir/base/range', {range: relation.age_range})} unless relation.age_range.nil?
xml.ageString({value: relation.age_string}) unless relation.age_string.nil?
xml.deceasedBoolean({value: relation.deceased_boolean}) unless relation.deceased_boolean.nil?
xml.deceasedAge { |xml| xml << render('fhir/base/quantity', {quantity: relation.deceased_age}) } unless relation.deceased_age.nil?
xml.deceasedRange{ |xml| xml << render('fhir/base/range', {range: relation.deceased_range})} unless relation.deceased_range.nil?
xml.deceasedDate({value: relation.deceased_date}) unless relation.deceased_date.nil?
xml.deceasedString({value: relation.deceased_string}) unless relation.deceased_string.nil?
xml.note({value: relation.note}) unless relation.note.nil?

relation.condition.each do |condition|
  xml.condition {|xml| xml << render('condition', {condition: condition})}
end unless relation.condition.nil?

