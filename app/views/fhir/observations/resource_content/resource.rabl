node :type, :unless => lambda {|resource| resource.type.nil?} do |resource|
  {value: => resource.type}
end

node :url, :unless => lambda {|resource| resource.url.nil?} do |resource|
  {value: => resource.url}
end

node :display, :unless => lambda {|resource| p.display.nil?} do |resource|
  {value: => resource.display}
end