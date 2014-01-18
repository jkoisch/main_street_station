json.use      address.use if address.use
json.text     address.text if address.text
json.line     address.line if address.line
json.city     address.city if address.city
json.state    address.state if address.state
json.zip      address.zip if address.zip
json.country  address.country if address.country

if address.period
  json.period do
    json.partial! 'fhir/base/period', period: address.period
  end
end

