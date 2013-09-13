node :system, :unless => lambda {|b| b.system.nil?} do |b|
  b.system
end

node :value, :unless => lambda {|b| b.value.nil?} do |b|
  b.value
end

node :use, :unless => lambda {|b| b.use.nil?} do |b|
  b.use
end

node :period, :unless => lambda {|b| b.period.nil?} do |b|
  b.period
end