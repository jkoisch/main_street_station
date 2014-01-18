xml.type         resource.type
xml.readHistory  resource.read_history
xml.updateCreate resource.update_create
resource.operation.each do |operation|
  xml.operation { |xml| xml << render('operation', {operation: operation}) }
end