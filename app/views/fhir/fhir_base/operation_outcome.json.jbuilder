json.resourceType 'OperationOutcome'

# noinspection RubyResolve
json.issue @operation_outcome.issue do |issue|
  json.severity issue.severity unless issue.severity.nil?

  json.code do
     json.partial! 'fhir/base/codeable_concept', codeable_concept: issue.code
  end unless issue.code.nil?

  json.details issue.details unless issue.details.nil?

  json.location issue.location do |location|
    json.location location
  end unless issue.location.nil?

end unless @operation_outcome.issue.nil?
