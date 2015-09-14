xml.code{ |xml| xml << render('fhir/base/coding', {coding: event.code})} unless event.code.nil?
xml.category ({value: event.category}) unless event.category.nil?
xml.mode ({value: event.mode}) unless event.mode.nil?
xml.focus ({value: event.focus}) unless event.focus.nil?
xml.request { |xml| xml << render('fhir/base/resource_reference', {resource_reference: event.request})} unless event.request.nil?
xml.response { |xml| xml << render('fhir/base/resource_reference', {resource_reference: event.response})} unless event.response.nil?
xml.documentation ({value: event.documentation}) unless event.documentation.nil?