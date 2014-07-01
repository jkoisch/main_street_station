xml.instruct!
xml.observation do
  xml << render(:partial => 'observation', :locals => { :resource => @observation})
end
