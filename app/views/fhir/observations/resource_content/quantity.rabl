node :value, :unless => lambda {|b| b.value.nil?} do |b|
  b.value
end

node :comparator, :unless => lambda {|b| b.comparator.nil?} do |b|
  b.comparator
end

node :units, :unless => lambda {|b| b.units.nil?} do |b|
  b.units
end

node :system, :unless => lambda {|b| b.system.nil?} do |b|
  b.system
end

node :code, :unless => lambda {|b| b.code.nil?} do |b|
  b.code
end