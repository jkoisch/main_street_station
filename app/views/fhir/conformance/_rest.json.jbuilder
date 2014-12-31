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

json.operation rest.operation.each do |operation|
  json.partial! 'operation', operation: operation
end unless rest.operation.nil?

json.documentMailbox rest.document_mailbox do |document_mailbox|
  json.documentMailbox rest.document_mailbox
end unless rest.document_mailbox.nil?