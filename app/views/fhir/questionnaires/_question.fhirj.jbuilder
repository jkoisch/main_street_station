json.linkId question.link_id unless question.link_id.nil?

json.concept question.concept do |concept|
  json.partial! 'fhir/base/coding', coding: concept
end unless question.concept.nil?

json.text     question.text unless question.text.nil?
json.type     question.type unless question.type.nil?
json.required question.required unless question.required.nil?
json.repeats  question.repeats unless question.repeats.nil?

json.options do
  json.partial! 'fhir/base/reference', reference: question.options
end unless question.options.nil?

json.option question.option do |option|
  json.partial! 'fhir/base/coding', coding: option
end unless question.option.nil?

json.group question.group do |group|
    json.partial! 'group', group: group
end unless question.group.nil?