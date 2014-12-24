json.mode           rest.mode unless rest.mode.nil?
json.documentation  rest.documentation unless rest.documentation.nil?

json.security do
  json.partial! 'security', security: rest.security
end unless rest.security.nil?

json.resource rest.resource.each do |resource|
  json.partial! 'resource', resource: resource
end unless rest.resource.nil?

json.operation rest.operation.each do |operation|
  json.partial! 'operation', operation: operation
end unless rest.operation.nil?

json.query rest.query.each do |query|
  json.partial! 'query', query: query
end unless rest.query.nil?

json.documentMailbox rest.document_mailbox unless rest.document_mailbox.nil?