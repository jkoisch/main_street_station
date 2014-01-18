json.type         resource.type
json.readHistory  resource.read_history
json.updateCreate resource.update_create
json.operation resource.operation do |operation|
  json.partial! 'operation', operation: operation
end