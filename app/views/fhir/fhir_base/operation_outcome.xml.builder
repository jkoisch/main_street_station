xml.OperationOutcome(xmlns: 'http://hl7.org/fhir') do |xml|
  @operation_outcome.issue.each do |issue|
    xml.issue do |xml|
      xml.severity(value: issue.severity) if issue.severity
      xml.details(value: issue.details) if issue.details
    end
  end
end
