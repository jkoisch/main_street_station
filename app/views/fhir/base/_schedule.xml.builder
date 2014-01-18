schedule.event.each do |event_property|
  xml.event({value: schedule.event_property})
end if schedule.event
xml.repeat { |xml| xml << render('fhir/base/repeat', {repeat: schedule.repeat}) } if schedule.repeat

