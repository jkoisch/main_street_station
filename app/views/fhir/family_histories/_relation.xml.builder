xml.name({value: relation.name}) unless relation.name.nil?
xml.relationship{ |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: relation.relationship})} unless relation.relationship.nil?
xml.bornPeriod { |xml| xml << render('fhir/base/period', {period: relation.born_period})} unless relation.born_period.nil?
xml.deceasedBoolean({value: relation.deceased_boolean}) unless relation.deceased_boolean.nil?
xml.note({value: relation.note}) unless relation.note.nil?

relation.condition.each do |condition|
  xml.condition {|xml| xml << render('condition', {condition: condition})}
end unless relation.condition.nil?

