json.name do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: group.name
end unless group.name.nil?

json.header   group.header unless group.header.nil?
json.text     group.text unless group.text.nil?
json.ordered  group.ordered unless group.ordered.nil?

json.group group.group do |group|
  json.partial! 'group', group: group
end unless group.group.nil?

json.question group.question do |question|
  json.partial! 'question', question: question
end unless group.question.nil?

