xml.mode({value: rest.mode}) unless rest.mode.nil?
xml.documentation({value: rest.documentation}) unless rest.documentation.nil?
xml.security { |xml| xml << render('security', {security: rest.security}) } unless rest.security.nil?

rest.resource.each do |resource|
  xml.resource { |xml| xml << render('resource', {resource: resource}) }
end unless rest.resource.nil?

rest.interaction.each do |interaction|
  xml.interaction { |xml| xml << render('interaction', {interaction: interaction}) }
end unless rest.interaction.nil?

rest.operation.each do |operation|
  xml.operation { |xml| xml << render('operation', {operation: operation}) }
end unless rest.operation.nil?

rest.document_mailbox.each do |mailbox|
  xml.documentMailbox({value: mailbox})
end unless rest.document_mailbox.nil?

