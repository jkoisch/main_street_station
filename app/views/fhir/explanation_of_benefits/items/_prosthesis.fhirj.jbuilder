json.initial prosthesis.initial unless prosthesis.initial.nil?
json.priorDate prosthesis.prior_date unless prosthesis.prior_date.nil?

json.priorMaterial do
  json.partial! 'fhir/base/coding', coding: prosthesis.prior_material
end unless prosthesis.prior_material.nil?