node :type, :unless => lambda {|b| b.type.nil?} do |b|
  b.type
end

node :reference, :unless => lambda {|b| b.reference.nil?} do |b|
  b.reference
end

node :display, :unless => lambda {|b| b.display.nil?} do |b|
  b.display
end