json.city     address.city
json.country  address.country
json.line     address.line

if address.period
  json.period do
    json.partial! 'fhir/base/period', period: address.period
  end
end

json.state    address.state
json.text     address.text
json.use      address.use
json.zip      address.zip
