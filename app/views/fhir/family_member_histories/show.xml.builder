xml.instruct!
xml.family_member_history do
  xml << render(:partial => 'family_member_history', :locals => { :resource => @family_member_history})
end
