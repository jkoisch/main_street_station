xml.instruct!
xml.condition do
  xml << render(:partial => 'condition', :locals => { :resource => @condition})
end