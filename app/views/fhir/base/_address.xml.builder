xml.use({value: address.use}) if address.use
xml.text({value: address.text}) if address.text

address.line.each do |line_property|
  xml.line({value: line_property})
end if address.line

xml.city({value: address.city}) if address.city
xml.state({value: address.state}) if address.state
xml.zip({value: address.zip}) if address.zip
xml.country({value: address.country}) if address.country
xml.period { |xml| xml << render('fhir/base/period', {period: address.period}) } if address.period