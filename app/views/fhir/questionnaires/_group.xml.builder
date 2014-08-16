xml.name { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: group.name})} unless group.name.nil?
xml.header({value: group.header}) unless group.header.nil?
xml.text({value: group.text}) unless group.text.nil?
xml.subject { |xml| xml << render('fhir/base/resource_reference', {resource_reference: group.subject})} unless group.subject.nil?
xml.ordered({value: group.ordered}) unless group.ordered.nil?

group.group.each do |group|
  xml.group { |xml| xml << render('group', {group: group})}
end unless group.group.nil?

group.question.each do |question|
  xml.question { |xml| xml << render('question', {question: question})}
end unless group.question.nil?