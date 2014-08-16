json.name do
  json.partial! 'fhir/base/codeable_concept', codeable_concept: question.name
end unless question.name.nil?

json.text           question.text unless question.text.nil?
json.answerDecimal  question.answer_decimal unless question.answer_decimal.nil?
json.answerInteger  question.answer_integer unless question.answer_integer.nil?
json.answerBoolean  question.answer_boolean unless question.answer_boolean.nil?
json.answerDate     question.answer_date unless question.answer_date.nil?
json.answerString   question.answer_string unless question.answer_string.nil?
json.answerDatetime question.answer_datetime unless question.answer_datetime.nil?
json.answerInstant  question.answer_instant unless question.answer_instant.nil?

json.choice question.choice do |choice|
  json.partial! 'fhir/base/coding', coding: choice
end unless question.choice.nil?

json.options do
  json.partial! 'fhir/base/resource_reference', resource_reference: question.options
end unless question.options.nil?

json.remarks        question.remarks unless question.remarks.nil?

json.group question.group do |group|
    json.partial! 'group', group: group
end unless question.group.nil?