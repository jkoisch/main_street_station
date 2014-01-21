json.use    human_name.use if human_name.use
json.text   human_name.text if human_name.text
json.family human_name.family if human_name.family
json.given  human_name.given if human_name.given
json.prefix human_name.prefix if human_name.prefix
json.suffix human_name.suffix if human_name.suffix
if human_name.period
  json.period do
    json.partial! 'fhir/base/period', period: human_name.period
  end
end
