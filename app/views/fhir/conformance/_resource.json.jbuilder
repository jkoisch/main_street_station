json.type         resource.type unless resource.type.nil?

json.profile do
  json.partial 'fhir/base/reference', reference: resource.profile
end unless resource.profile.nil?

json.interaction resource.interaction do |interaction|
  json.partial! 'interaction', interaction: interaction
end unless resource.interaction.nil?

json.versioning resource.versioning unless resource.versioning.nil?
json.readHistory  resource.read_history unless resource.read_history.nil?
json.updateCreate resource.update_create unless resource.update_create.nil?
json.conditionalCreate resource.conditional_create unless resource.conditional_create.nil?
json.conditionalUpdate resource.conditional_update unless resource.conditional_update.nil?
json.conditionalDelete resource.conditional_delete unless resource.conditional_delete.nil?

json.searchInclude resource.search_include do |search_include|
  json.searchInclude search_include
end unless resource.search_include.nil?

json.searchRevInclude resource.search_rev_include do |search_rev_include|
  json.searchRevInclude search_rev_include
end unless resource.search_rev_include.nil?

json.searchParam resource.search_param do |search_param|
  json.partial! 'search_param', search_param: search_param
end unless resource.search_param.nil?