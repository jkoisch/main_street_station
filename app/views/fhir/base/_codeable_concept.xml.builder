codeable_concept.coding.each do |coding_property|
  xml.coding { |xml| xml << render('fhir/base/coding', {coding: coding_property}) }
end if codeable_concept.coding
xml.text({value: codeable_concept.text}) if codeable_concept.coding
