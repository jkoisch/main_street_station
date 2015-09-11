xml.authorResourceReference{ |xml| xml << render('fhir/base/resource_reference', {resource_reference: annotation.author_resource_reference})} unless annotation.author_resource_reference.nil?
xml.authorString({value: annotation.author_string}) unless annotation.author_string.nil?
xml.time({value: annotation.time}) unless annotation.time.nil?
xml.text({value: annotation.text}) unless annotation.text.nil?
