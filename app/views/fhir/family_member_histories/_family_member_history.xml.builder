resource.identifier.each do |identifier|
  xml.identifier {|xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.patient { |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.patient})} unless resource.patient.nil?
xml.note({value: resource.note}) unless resource.note.nil?

resource.relation.each do |relation|
  xml.relation { |xml| xml << render('relation', {relation: relation})}
end unless resource.relation.nil?
