xml.name { |xml| xml << render('fhir/base/codeable_concept', {codeable_concept: question.name})} unless question.name.nil?
xml.text({value: question.text}) unless question.text.nil?
xml.answerDecimal({value: question.answer_decimal}) unless question.answer_decimal.nil?
xml.answerInteger({value: question.answer_integer}) unless question.answer_integer.nil?
xml.answerBoolean({value: question.answer_boolean}) unless question.answer_boolean.nil?
xml.answerDate({value: question.answer_date}) unless question.answer_date.nil?
xml.answerString({value: question.answer_string}) unless question.answer_string.nil?
xml.answerDatetime({value: question.answer_datetime}) unless question.answer_datetime
xml.answerInstant({value: question.answer_instant}) unless question.answer_instant

question.choice.each do |choice|
  xml.choice { |xml| xml << render('fhir/base/coding', {coding: choice})}
end unless question.choice.nil?

xml.options { |xml| xml << render('fhir/base/reference', {reference: question.options})} unless question.options.nil?

xml.dataInteger({value: question.data_integer}) unless question.data_integer.nil?
xml.dataDate({value: question.data_date}) unless question.data_date.nil?
xml.dataString({value: question.data_string}) unless question.data_string.nil?
xml.dataBoolean({value: question.data_boolean}) unless question.data_boolean.nil?

xml.remarks({value: question.remarks}) unless question.remarks.nil?

question.group.each do |group|
  xml.group { |xml| xml << render('group', {group: group})}
end unless question.group.nil?