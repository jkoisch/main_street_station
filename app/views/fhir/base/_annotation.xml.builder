xml.authorReference{ |xml| xml << render('fhir/base/reference', {reference: annotation.author_reference})} unless annotation.author_reference.nil?
xml.authorString({value: annotation.author_string}) unless annotation.author_string.nil?
xml.time({value: annotation.time}) unless annotation.time.nil?
xml.text({value: annotation.text}) unless annotation.text.nil?
