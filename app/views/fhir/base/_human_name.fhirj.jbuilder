json._id    human_name._id unless human_name._id.nil?
json.use    human_name.use unless human_name.use.nil?
json.text   human_name.text unless human_name.text.nil?
json.family human_name.family unless human_name.family.nil?
json.given  human_name.given unless human_name.given.nil?
json.prefix human_name.prefix unless human_name.prefix.nil?
json.suffix human_name.suffix unless human_name.suffix.nil?

json.period do
  json.partial! 'fhir/base/period', period: human_name.period
end unless human_name.period.nil?
