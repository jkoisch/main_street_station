json.numerator do
  json.partial! 'fhir/base/quantity', numerator: ratio.numerator
end unless ratio.numerator.nil?

json.denominator do
  json.partial! 'fhir/base/quantity', denominator: ratio.denominator
end unless ratio.denominator.nil?

