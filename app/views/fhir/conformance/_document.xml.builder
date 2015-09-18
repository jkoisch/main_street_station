xml.mode ({value: document.mode}) unless document.mode.nil?
xml.documentation ({value: document.documentation}) unless document.documentation.nil?
xml.profile { |xml| xml << render('fhir/base/reference', {reference: document.profile}) } unless document.profile.nil?
