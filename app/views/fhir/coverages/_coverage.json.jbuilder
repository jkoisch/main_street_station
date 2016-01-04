json.resourceType 'Coverage'

json.id resource.id unless resource.id.nil?

json.issuer do
  json.partial! 'fhir/base/reference', reference: resource.issuer
end unless resource.issuer.nil?

json.bin do
  json.partial! 'fhir/base/identifier', identifier: resource.bin
end unless resource.bin.nil?

json.period do
  json.partial! 'fhir/base/period', period: resource.period
end unless resource.period.nil?

json.type do
  json.partial! 'fhir/base/coding', coding: resource.type
end unless resource.type.nil?

json.identifier resource.identifier do |identifier|
  json.partial! 'fhir/base/identifier', identifier: identifier
end unless resource.identifier.nil?

json.group    resource.group unless resource.group.nil?
json.plan     resource.plan unless resource.plan.nil?
json.subPlan  resource.sub_plan unless resource.sub_plan.nil?

json.dependent resource.dependent unless resource.dependent.nil?
json.sequence   resource.sequence unless resource.sequence.nil?
#json.dependent do
#  json.partial! 'fhir/base/simple_integer', simple_integer: resource.dependent
#end unless resource.dependent.nil?

#json.sequence do
#  json.partial! 'fhir/base/simple_integer', simple_integer: resource.sequence
#end unless resource.sequence.nil?

json.subscriber do
  json.partial! 'fhir/base/reference', reference: resource.subscriber
end unless resource.subscriber.nil?

json.network do
  json.partial! 'fhir/base/identifier', identifier: resource.network
end unless resource.network.nil?

json.contract resource.contract do |contract|
  json.partial! 'fhir/base/reference', reference: contract
end unless resource.contract.nil?