xml.name({value: search_param.name}) unless search_param.instance_variable_names.nil?
xml.source({value: search_param.source}) unless search_param.source.nil?
xml.type({value: search_param.type}) unless search_param.type.nil?
xml.documentation({value: search_param.documentation}) unless search_param.documentation.nil?
xml.xpath({value: search_param.xpath}) unless search_param.xpath.nil?
xml.target({value: search_param.target}) unless search_param.target.nil?
xml.chain({value: search_param.chain}) unless search_param.chain.nil?