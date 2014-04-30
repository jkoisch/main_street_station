json.resourceType 'Bundle'
json.type 'Device list'
json.updated DateTime.now
json.id "urn:uuid: #{UUID.new.generate}"
json.totalResults @devices.length
json.entry @devices do |device|
  json.title 'YouCentric FHIR Device'
  json.id "http://mainstreet.youcentric.com/fhir/Device/#{device.id}"
  json.updated DateTime.now
  json.content do
    json.partial! 'device', resource: device
  end
end
