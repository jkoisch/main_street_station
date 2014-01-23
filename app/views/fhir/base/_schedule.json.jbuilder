json.period do
  json.partial! 'fhir/base/period', event: schedule.event
end unless schedule.event.nil?

json.repeat do
  json.partial! 'fhir/base/repeat', repeat: schedule.repeat
end unless schedule.repeat.nil?
