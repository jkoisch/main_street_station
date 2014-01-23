xml.use({value: human_name.use}) unless human_name.use.nil?
xml.text({value: human_name.text}) unless human_name.text.nil?
human_name.family.each do |family_property|
  xml.family({value: family_property})
end unless human_name.family.nil?
human_name.given.each do |given_property|
  xml.given({value: given_property})
end unless human_name.given.nil?
human_name.prefix.each do |prefix_property|
  xml.prefix({value: prefix_property})
end unless human_name.prefix.nil?
human_name.suffix.each do |suffix_property|
  xml.suffix({value: suffix_property})
end unless human_name.suffix.nil?
xml.period { |xml| xml << render('fhir/base/period', {period: human_name.period}) } unless human_name.period.nil?