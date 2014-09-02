xml.instruct!
xml.locations do
  @locations.each do |location|
    xml.location do
      xml << render(:partial => 'location', :locals => { :resource => location})
    end
  end
end