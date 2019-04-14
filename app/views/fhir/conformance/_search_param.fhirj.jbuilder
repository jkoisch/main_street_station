json.name           search_param.name unless search_param.name.nil?
json.definition     search_param.definition unless search_param.definition.nil?
json.type           search_param.type unless search_param.type.nil?
json.documentation  search_param.documentation unless search_param.documentation.nil?

json.target search_param.target do |target|
  json.target search_param.target
end unless search_param.target.nil?

json.modifier search_param.modifier do |modifier|
  json.modifier search_param.modifier
end unless search_param.modifier.nil?

json.chain search_param.chain do |chain|
 json.chain search_param.chain
end unless search_param.chain.nil?