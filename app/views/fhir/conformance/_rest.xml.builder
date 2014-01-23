xml.mode({value: rest.mode}) unless rest.mode.nil?
xml.documentation({value: rest.documentation}) unless rest.documentation.nil?
rest.operation.each do |operation|
  xml.operation { |xml| xml << render('operation', {operation: operation}) }
end unless rest.operation.nil?
#xml.security { |xml| xml << render('security', {security: rest.security}) } unless rest.security
rest.resource.each do |resource|
  xml.resource { |xml| xml << render('resource', {resource: resource}) }
end unless rest.resource.nil?
rest.query.each do |query|
  xml.query { |xml| xml << render('query', {query: query}) }
end unless rest.query.nil?
rest.document_mailbox.each do |mailbox|
  xml.documentMailbox({value: mailbox})
end unless rest.document_mailbox.nil?

