child({:coding => :coding}, :unless => lambda {|r| r.coding.nil?}) do
   extends "fhir/observations/resource_content/coding"
end

node :primary, :unless => lambda {|b| b.primary.nil?} do |b|
  b.primary
end

node :text, :unless => lambda {|b| b.text.nil?} do |b|
  b.text
end