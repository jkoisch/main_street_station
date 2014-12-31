xml.mode ({value: document.mode}) unless document.mode.nil?
xml.documentation ({value: document.documentation}) unless document.documentation.nil?
xml.profile { |xml| xml << render('fhir/base/resource_reference', {resource_reference: document.profile}) } unless document.profile.nil?
