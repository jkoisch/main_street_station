xml.endpoint ({value: messaging.endpoint}) unless messaging.endpoint.nil?
xml.reliableCache ({value: messaging.reliable_cache}) unless messaging.reliable_cache.nil?
xml.documentation ({value: messaging.documentation}) unless messaging.documentation.nil?
messaging.event.each do |event|
  xml.event { |xml| xml << render('event', {event: event})}
end unless messaging.event.nil?
