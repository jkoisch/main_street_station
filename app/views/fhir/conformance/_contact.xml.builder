xml.name ({value: contact.name}) unless contact.name.nil?

contact.telecom.each do |telecom|
  xml.telecom { |xml| xml << render('fhir/base/contact_point', {contact_point: telecom})}
end unless contact.telecom.nil?