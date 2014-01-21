contact.relationship.each do |relationship|
  xml.relationship { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: relationship})}
end unless contact.relationship.nil?
xml.name { |xml| xml << render('fhir/base/human_name', {human_name: contact.name})} unless contact.name.nil?
contact.telecom.each do |telecom|
  xml.telecom { |xml| xml << render('fhir/base/contact', {contact: telecom})}
end unless contact.telecom.nil?
xml.address { |xml| xml << render('fhir/base/address', {address: contact.address})} unless contact.address.nil?
xml.gender { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: contact.gender})} unless contact.gender.nil?
