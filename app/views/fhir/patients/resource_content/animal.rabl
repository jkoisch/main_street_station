child :breed, :unless => lambda {|animal| animal.breed.nil?} do
  extends "fhir/patients/resource_content/codeable_concept"
end

child :genderStatus, :unless => lambda {|animal| animal.genderStatus.nil?} do
  extends "fhir/patients/resource_content/codeable_concept"
end

child :species, :unless => lambda {|animal| animal.species.nil?} do
  extends "fhir/patients/resource_content/codeable_concept"
end
