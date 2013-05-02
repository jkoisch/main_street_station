node :type, :unless => lambda {|resource| resource.type.nil?} do |resource|
  resource.type
end

node :url, :unless => lambda {|resource| resource.url.nil?} do |resource|
  resource.url
end

node :display, :unless => lambda {|resource| p.display.nil?} do |resource|
  resource.display
end