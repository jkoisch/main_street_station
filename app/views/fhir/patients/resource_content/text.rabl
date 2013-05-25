node :div, :unless => lambda {|t| t.div.nil?} do |t|
  t.div
end

node :status, :unless => lambda {|t| t.status.nil?} do |t|
  t.status
end