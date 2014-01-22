json.type         resource.type if resource.type
json.operation resource.operation do |operation|
  json.partial! 'operation', operation: operation
end if resource.operation
json.readHistory  resource.read_history unless resource.read_history.nil?
json.updateCreate resource.update_create unless resource.update_create.nil?
json.searchInclude resource.search_include do |search_include|
  json.searchInclude search_include
end if resource.search_include
json.searchParam resource.search_param do |search_param|
  json.partial! 'search_param', search_param: search_param
end if resource.search_param