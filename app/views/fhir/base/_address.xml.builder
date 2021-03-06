xml.use({value: address.use}) unless address.use.nil?
xml.type({value: address.type}) unless address.type.nil?
xml.text({value: address.text}) unless address.text.nil?

address.line.each do |line_property|
  xml.line({value: line_property})
end unless address.line.nil?

xml.city({value: address.city}) unless address.city.nil?
xml.district({value: address.district}) unless address.district.nil?
xml.state({value: address.state}) unless address.state.nil?
xml.postalCode({value: address.postal_code}) unless address.postal_code.nil?
xml.country({value: address.country}) unless address.country.nil?
xml.period { |xml| xml << render('fhir/base/period', {period: address.period}) } unless address.period.nil?