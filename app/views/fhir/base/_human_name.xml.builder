xml.use({value: human_name.use}) if human_name.use
xml.text({value: human_name.text}) if human_name.text
human_name.family.each do |family_property|
  xml.family({value: family_property})
end if human_name.family
human_name.given.each do |given_property|
  xml.given({value: given_property})
end if human_name.given
human_name.prefix.each do |prefix_property|
  xml.prefix({value: prefix_property})
end if human_name.prefix
human_name.suffix.each do |suffix_property|
  xml.suffix({value: suffix_property})
end if human_name.suffix
xml.period { |xml| xml << render('fhir/base/period', {period: human_name.period}) } if human_name.period