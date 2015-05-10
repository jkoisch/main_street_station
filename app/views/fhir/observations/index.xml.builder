xml.instruct!
xml_bundle(xml, @observations)
# xml.observations do
#   @observations.each do |observation|
#     xml.observation do
#       xml << render(:partial => 'observation', :locals => { :resource => observation})
#     end
#   end
# end