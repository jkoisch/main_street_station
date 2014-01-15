json.family human_name.family
json.given  human_name.given

if human_name.period
  json.period do
    json.partial! 'fhir/base/period', period: human_name.period
  end
end

json.prefix human_name.prefix
json.suffix human_name.suffix
json.text   human_name.text
json.use    human_name.use