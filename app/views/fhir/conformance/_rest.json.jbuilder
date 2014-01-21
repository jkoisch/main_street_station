json.mode rest.mode if rest.mode
json.documentation rest.documentation if rest.documentation
#json.security json.partial! 'security', security: rest.security
json.operation rest.operation.each do |operation|
  json.partial! 'operation', operation: operation
end if rest.operation
json.resource rest.resource.each do |resource|
  json.partial! 'resource', resource: resource
end if rest.resource
json.query rest.query.each do |query|
  json.partial! 'query', query: query
end if rest.query
json.documentMailbox rest.document_mailbox if rest.document_mailbox