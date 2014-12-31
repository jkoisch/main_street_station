xml.name({value: search_param.name}) unless search_param.instance_variable_names.nil?
xml.definition({value: search_param.definition}) unless search_param.definition.nil?
xml.type({value: search_param.type}) unless search_param.type.nil?
xml.documentation({value: search_param.documentation}) unless search_param.documentation.nil?

search_param.target.each do |target|
  xml.target search_param.target
end unless search_param.target.nil?

search_param.chain.each do |chain|
  xml.chain search_param.chain
end unless search_param.chain.nil?