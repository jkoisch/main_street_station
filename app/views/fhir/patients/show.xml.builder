xml.instruct!
xml.patient do
  xml << render(:partial => 'patient', :locals => { :resource => @patient})
end