json.type do
  json.partial! 'fhir/base/coding', coding: financial.type
end unless financial.type.nil?

json.benefitUnsignedInt financial.benefit_integer unless financial.benefit_integer.nil?

json.benefitQuantity do
  json.partial! 'fhir/base/quantity', quantity: financial.benefit_quantity
end unless financial.benefit_quantity.nil?

json.benefitUsedUnsignedInt financial.benefit_used_integer unless financial.benefit_used_integer.nil?

json.benefitUsedQuantity do
  json.partial! 'fhir/base/quantity', quantity: financial.benefit_used_quantity
end unless financial.benefit_used_quantity.nil?