json.resourceType 'OperationOutcome'

# noinspection RubyResolve
json.issue @operation_outcome.issue do |issue|
  json.severity issue.severity unless issue.severity.nil?
  json.details issue.details unless issue.details.nil?
end unless @operation_outcome.issue.nil?
