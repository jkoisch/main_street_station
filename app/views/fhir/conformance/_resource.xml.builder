xml.type({value: resource.type}) unless resource.type.nil?
resource.operation.each do |operation|
  xml.operation { |xml| xml << render('operation', {operation: operation}) }
end unless resource.operation.nil?
xml.readHistory({value: resource.read_history}) unless resource.read_history.nil?
xml.updateCreate({value: resource.update_create}) unless resource.update_create.nil?
resource.search_include.each do |search_include|
  xml.searchInclude search_include
end unless resource.search_include.nil?
resource.search_param.each do |search_param|
  xml.searchParam { |xml| xml << render('search_param', {searchParam: search_param}) }
end unless resource.search_param.nil?
