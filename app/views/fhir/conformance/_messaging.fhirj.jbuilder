json.endpoint messaging.event do |endpoint|
  json.partial! 'endpoint', endpoint: endpoint
end unless messaging.endpoint.nil?

json.reliableCache  messaging.reliable_cache unless messaging.reliable_cache.nil?
json.documentation  messaging.documentation unless messaging.documentation.nil?

json.event messaging.event do |event|
  json.partial! 'event', event: event
end unless messaging.event.nil?
