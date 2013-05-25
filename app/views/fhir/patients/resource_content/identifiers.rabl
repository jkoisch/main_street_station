node :id, :unless => lambda {|i| i.id.nil?} do |i|
  {:value => i.id}
end

node :assigner, :unless => lambda {|i| i.assigner.nil?} do |i|
  extends "fhir/patients/resource_content/resource"
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
  extends "fhir/patients/resource_content/period"
end
