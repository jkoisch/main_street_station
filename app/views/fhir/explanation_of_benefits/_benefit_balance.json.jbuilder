json.category do
  json.partial! 'fhir/base/coding', coding: benefit_balance.category
end unless benefit_balance.category.nil?

json.subCategory do
  json.partial! 'fhir/base/coding', coding: benefit_balance.sub_category
end unless benefit_balance.sub_category.nil?

json.network do
  json.partial! 'fhir/base/coding', coding: benefit_balance.network
end unless benefit_balance.network.nil?

json.unit do
  json.partial! 'fhir/base/coding', coding: benefit_balance.unit
end unless benefit_balance.unit.nil?

json.term do
  json.partial! 'fhir/base/coding', coding: benefit_balance.term
end unless benefit_balance.term.nil?

json.financial benefit_balance.financial do |financial|
  json.partial! 'fhir/explanation_of_benefits/benefit_balances/financial', financial: financial
end unless benefit_balance.financial.nil?