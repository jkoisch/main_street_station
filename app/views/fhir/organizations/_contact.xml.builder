xml.purpose {|xml| xml << render('fhir/base/codeable_concept', codeable_concept: contact.purpose)} unless contact.purpose.nil?
xml.name { |xml| xml << render('fhir/base/human_name', human_name: contact.name)} unless contact.name.nil?

contact.telecom.each do |telecom|
  xml.telecom {|xml| xml << render('fhir/base/contact_point', {contact_point: telecom})}
end unless contact.telecom.nil?

xml.address { |xml| xml << render('fhir/base/address', address: contact.address)} unless contact.address.nil?