xml.instruct!
xml.practitioner do
  xml << render(:partial => 'practitioner', :locals => { :practitioner => @practitioner})
end