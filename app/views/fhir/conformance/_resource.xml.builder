xml.type({value: resource.type}) unless resource.type.nil?

xml.profile { |xml| xml << render('fhir/base/resource_reference', {resource_reference: resource.profile})} unless resource.profile.nil?

resource.interaction.each do |interaction|
  xml.interaction { |xml| xml << render('interaction', {interaction: interaction})}
end unless resource.interaction.nil?

xml.versioning({value: resource.interaction}) unless resource.interaction.nil?
xml.readHistory({value: resource.read_history}) unless resource.read_history.nil?
xml.updateCreate({value: resource.update_create}) unless resource.update_create.nil?

resource.search_include.each do |search_include|
  xml.searchInclude search_include
end unless resource.search_include.nil?

resource.search_param.each do |search_param|
  xml.searchParam { |xml| xml << render('search_param', {searchParam: search_param}) }
end unless resource.search_param.nil?
