node :start, :unless => lambda {|period| period.start.nil?} do |period|
  {:value => period.start}
end

node :end, :unless => lambda {|period| period.end.nil?} do |period|
  {:value => period.end}
end