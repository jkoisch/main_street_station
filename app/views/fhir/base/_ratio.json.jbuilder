if ratio.denominator
  json.denominator do
    json.partial! 'fhir/base/quantity', denominator: ratio.denominator
  end
end

if ratio.numerator
  json.numerator do
    json.partial! 'fhir/base/quantity', numerator: ratio.numerator
  end
end