node :key, :unless => lambda {|i| i.key.nil?} do |i|
  {:value => i.key}
end

node :assigner, :unless => lambda {|i| i.assigner.nil?} do |i|
  extends "fhir/observations/resource_content/resource"
end

node :label, :unless => lambda {|i| i.label.nil?} do |i|
  {:value => i.label}
end

node :system, :unless => lambda {|i| i.system.nil?} do |i|
  {:value => i.system}
end

node :use, :unless => lambda {|i| i.use.nil?} do |i|
  {:value => i.use}
end

child :period, :unless => lambda {|p| p.period.nil?} do
  extends "fhir/observations/resource_content/period"
end
