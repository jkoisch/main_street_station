node :system, :unless => lambda {|b| b.system.nil?} do |b|
  {:value => ERB::Util.h(b.system) }
end

node :code, :unless => lambda {|b| b.code.nil?} do |b|
  {:value => ERB::Util.h(b.code) }
end

node :display, :unless => lambda {|b| b.display.nil?} do |b|
  {:value => ERB::Util.h(b.display) }
end