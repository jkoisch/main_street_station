json.linkId group.link_id unless group.link_id.nil?
json.title  group.title unless group.title.nil?

json.concept group.concept do |concept|
  json.partial! 'fhir/base/coding', coding: concept
end unless group.concept.nil?

json.text     group.text unless group.text.nil?
json.required group.required unless group.required.nil?
json.repeats  group.repeats unless group.repeats.nil?

json.group group.group do |group|
  json.partial! 'group', group: group
end unless group.group.nil?

json.question group.question do |question|
  json.partial! 'question', question: question
end unless group.question.nil?

