xml.instruct!
xml.family_history do
  xml << render(:partial => 'family_history', :locals => { :resource => @family_history})
end
