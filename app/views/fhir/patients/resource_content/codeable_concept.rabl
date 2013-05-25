node :coding, :unless => lambda {|b| b.coding.nil?} do |b|
  b.coding
end

node :primary, :unless => lambda {|b| b.primary.nil?} do |b|
  b.primary
end

node :text, :unless => lambda {|b| b.text.nil?} do |b|
  b.text
end