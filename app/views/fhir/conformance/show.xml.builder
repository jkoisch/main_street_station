xml.instruct!
xml.Conformance({xmlns: "http://hl7.org/fhir"}) do |xml|
  xml << render('conformance', {resource: @conformance})
end