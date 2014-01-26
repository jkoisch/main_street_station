xml.status({value: resource.status}) unless resource.status.nil?
xml.authored({value: resource.authored}) unless resource.authored.nil?
xml.name { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: resource.name})} unless resource.name.nil?

resource.identifier.each do |identifier|
  xml.identifier {|xml| xml << render('fhir/base/identifier', {identifier: identifier})}
end unless resource.identifier.nil?

xml.group { |xml| xml << render('group', {group: resource.group})} unless resource.group.nil?
