xml.OperationOutcome(xmlns: 'http://hl7.org/fhir') do |xml|
  @operation_outcome.issue.each do |issue|
    xml.issue do
      xml.severity(value: issue.severity) if issue.severity
      xml.code{ |xml| xml << render('fhir/base/codeable_concept', codeable_concept: issue.code)} unless issue.code.nil?
      xml.details(value: issue.details) if issue.details

      issue.location.each do |location|
        xml.location location
      end unless issue.location.nil?
    end
  end
end
