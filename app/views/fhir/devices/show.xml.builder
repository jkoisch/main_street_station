xml.instruct!
xml.device do
  xml << render(:partial => 'device', :locals => { :resource => @device})
end