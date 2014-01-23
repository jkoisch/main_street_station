json.use      address.use unless address.use.nil?
json.text     address.text unless address.text.nil?
json.line     address.line unless address.line.nil?
json.city     address.city unless address.city.nil?
json.state    address.state unless address.state.nil?
json.zip      address.zip.to_s unless address.zip.nil?
json.country  address.country unless address.country.nil?

json.period do
  json.partial! 'fhir/base/period', period: address.period
end unless address.period.nil?

