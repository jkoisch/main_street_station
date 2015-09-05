xml.purpose {|xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.purpose)} unless resource.purpose.nil?
xml.name { |xml| xml << render('fhir/base/human_name', human_name: resource.name)} unless resource.name.nil?

resource.telecom.each do |telecom|
  xml.telecom {|xml| xml << render('fhir/base/contact_point', {contact_point: telecom})}
end unless resource.telecom.nil?

xml.address { |xml| xml << render('fhir/base/address', address: resource.address)} unless resource.address.nil?