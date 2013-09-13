node :system, :unless => lambda {|b| b.system.nil?} do |b|
  b.system
end

node :code, :unless => lambda {|b| b.code.nil?} do |b|
  b.code
end

node :display, :unless => lambda {|b| b.display.nil?} do |b|
  b.display
end