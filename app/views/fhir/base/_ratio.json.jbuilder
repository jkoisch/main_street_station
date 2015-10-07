json.numerator do
  json.partial! 'fhir/base/quantity', quantity: ratio.numerator
end unless ratio.numerator.nil?

json.denominator do
  json.partial! 'fhir/base/quantity', quantity: ratio.denominator
end unless ratio.denominator.nil?

