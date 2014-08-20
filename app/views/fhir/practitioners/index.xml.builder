xml.instruct!
xml.practitioners do
  @practitioners.each do |practitioner|
    xml.practitioner do
      xml << render(:partial => 'practitioner', :locals => { :resource => practitioner})
    end
  end
end