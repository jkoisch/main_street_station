xml.instruct!
xml.location do
  xml << render(:partial => 'location', :locals => { :resource => @location })
end
