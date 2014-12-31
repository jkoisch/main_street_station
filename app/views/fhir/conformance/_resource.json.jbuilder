json.type         resource.type unless resource.type.nil?

json.profile do
  json.partial 'fhir/base/resource_reference', resource_reference: resource.profile
end unless resource.profile.nil?

json.interaction resource.interaction do |interaction|
  json.partial! 'interaction', interaction: interaction
end unless resource.interaction.nil?

json.versioning resource.versioning unless resource.versioning.nil?
json.readHistory  resource.read_history unless resource.read_history.nil?
json.updateCreate resource.update_create unless resource.update_create.nil?

json.searchInclude resource.search_include do |search_include|
  json.searchInclude search_include
end unless resource.search_include.nil?

json.searchParam resource.search_param do |search_param|
  json.partial! 'search_param', search_param: search_param
end unless resource.search_param.nil?