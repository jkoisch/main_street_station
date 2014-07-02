xml.instruct!
xml.devices do
  @devices.each do |device|
    xml.device do
      xml << render(:partial => 'device', :locals => { :resource => device })
    end
  end
end