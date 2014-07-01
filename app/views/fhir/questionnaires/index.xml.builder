xml.instruct!
xml.questionnaires do
  @questionnaires.each do |questionnaire|
    xml.questionnaire do
      xml << render(:partial => 'questionnaire', :locals => { :question => questionnaire})
    end
  end
end