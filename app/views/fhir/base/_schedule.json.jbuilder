if schedule.period
  json.period do
    json.partial! 'fhir/base/period', period: schedule.period
  end
end
if schedule.repeat
  json.repeat do
    json.partial! 'fhir/base/repeat', repeat: schedule.repeat
  end
end
