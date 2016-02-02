json.sequence diagnosis.sequence unless diagnosis.sequence.nil?

json.diagnosis do
  json.partial! 'fhir/base/coding', coding: diagnosis.diagnosis
end unless diagnosis.diagnosis.nil?