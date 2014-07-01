xml.instruct!
xml.questionnaire do
  xml << render(:partial => 'questionnaire', :locals => { :question => @questionnaire})
end