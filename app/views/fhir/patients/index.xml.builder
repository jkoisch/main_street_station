xml.instruct!
xml_bundle(xml, @patients)
# xml.patients do
#   @patients.each do |patient|
#     xml.patient do
#       xml << render(:partial => 'patient', :locals => { :resource => patient})
#     end
#   end
# end