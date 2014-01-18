if schedule.event
  json.period do
    json.partial! 'fhir/base/period', event: schedule.event
  end
end
if schedule.repeat
  json.repeat do
    json.partial! 'fhir/base/repeat', repeat: schedule.repeat
  end
end
