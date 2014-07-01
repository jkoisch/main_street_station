xml.instruct!
xml.observations do
  @observations.each do |observation|
    xml.observation do
      xml << render(:partial => 'observation', :locals => { :resource => observation})
    end
  end
end