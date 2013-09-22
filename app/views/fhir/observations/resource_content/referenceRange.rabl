  child :meaning => :meaning do
     extends "fhir/observations/resource_content/codeable_concept"
   end

   child :range => :range do
     extends "fhir/observations/resource_content/component"
   end