json.versionId   meta.version_id unless meta.version_id.nil?
json.lastUpdated meta.last_updated unless meta.last_updated.nil?
json.profile     meta.profile unless meta.profile.nil?

json.security meta.security do |security|
  json.partial! 'fhir/base/coding', coding: security
end unless meta.security.nil?

json.tag meta.tag do |tag|
  json.partial! 'fhir/base/coding', coding: tag
end unless meta.tag.nil?
