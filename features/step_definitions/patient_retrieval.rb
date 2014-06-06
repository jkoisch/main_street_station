Given /^I have a request url for a patient$/ do
  id = '@1'
  uri = URI('http://gringotts.dev/clients/' + id)
end

When(/^I go to gringotts with a patient ID$/) do
  id = '@1'
  uri = URI('http://gringotts.dev/clients/' + id)
  Net::HTTP.get(uri)
end

Then /^I should get a patient record back$/ do
  id = '@345'
  uri = URI('http://gringotts.dev/clients/' + id)
  @patient_data = Net::HTTP.get(uri)
end