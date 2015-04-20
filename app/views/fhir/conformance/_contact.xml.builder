xml.name ({value: contact.name}) unless contact.name.nil?

contact.telecom.each do |telecom|
  xml.telecom { |xml| xml << render('fhir/base/contact', {contact: telecom})}
end unless contact.telecom.nil?