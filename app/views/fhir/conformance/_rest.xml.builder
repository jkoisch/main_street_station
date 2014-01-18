xml.mode
xml.documentation
rest.resource.each do |resource|
  xml.resource { |xml| xml << render('resource', {resource: resource}) }
end if rest.resource
rest.operation.each do |operation|
  xml.operation { |xml| xml << render('operation', {operation: operation}) }
end if rest.operation
rest.query.each do |query|
  xml.query { |xml| xml << render('query', {query: query}) }
end if rest.query
resource.document_mailbox.each do |mailbox|
  xml.documentMailbox({value: mailbox})
end if resource.document_mailbox

