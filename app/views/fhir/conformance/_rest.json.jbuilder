json.mode
json.documentation
json.mailbox
json.resource rest.resource do |resource|
  json.partial! 'resource', resource: resource
end
json.operation rest.operation do |operation|
  json.partial! 'operation', operation: operation
end
json.query rest.query do |query|
  json.partial! 'query', query: query
end