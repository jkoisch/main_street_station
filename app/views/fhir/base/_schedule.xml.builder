schedule.event.each do |event_property|
  xml.event({value: event_property})
end unless schedule.event.nil?
xml.repeat { |xml| xml << render('fhir/base/repeat', {repeat: schedule.repeat}) } unless schedule.repeat.nil?

