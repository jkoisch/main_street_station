codeable_concept.coding.each do |coding_property|
  xml.coding { |xml| xml << render('fhir/base/coding', {coding: coding_property}) }
end unless codeable_concept.coding.nil?
xml.text({value: codeable_concept.text}) unless codeable_concept.text.nil?
