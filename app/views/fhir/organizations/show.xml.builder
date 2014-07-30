xml.instruct!
xml.organization do
  xml << render(:partial => 'organization', :locals => { :resource => @organization})
end