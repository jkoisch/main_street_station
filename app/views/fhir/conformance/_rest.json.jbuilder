json.mode           rest.mode unless rest.mode.nil?
json.documentation  rest.documentation unless rest.documentation.nil?

json.security do
  json.partial! 'security', security: rest.security
end unless rest.security.nil?

json.resource rest.resource.each do |resource|
  json.partial! 'resource', resource: resource
end unless rest.resource.nil?

json.interaction rest.interaction.each do |interaction|
  json.partial! 'interaction', interaction: interaction
end unless rest.interaction.nil?

json.transactionMode  rest.transaction_mode unless rest.transaction_mode.nil?

json.searchParam rest.search_param.each do |search|
  json.partial! 'search_param', search_param: search
end unless rest.search_param.nil?

json.operation rest.operation.each do |operation|
  json.partial! 'operation', operation: operation
end unless rest.operation.nil?

json.compartment rest.compartment do |compartment|
  json.compartment rest.compartment
end unless rest.compartment.nil?