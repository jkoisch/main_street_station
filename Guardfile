# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# guard 'cucumber' do
#   watch(%r{^features/.+\.feature$})
#   watch(%r{^features/support/.+$})          { 'features' }
#   watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
# end
#
# guard 'livereload' do
#   watch(%r{app/views/.+\.(erb|haml|slim)$})
#   watch(%r{app/helpers/.+\.rb})
#   watch(%r{public/.+\.(css|js|html)})
#   watch(%r{config/locales/.+\.yml})
#   # Rails Assets Pipeline
#   watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
# end
#

guard :rspec, cmd: 'spring rspec', all_after_pass: true do
  watch(%r{^(spec/.+_spec\.rb)$}) { |m| "#{m[1]}" }
  watch('spec/rails_helper.rb')   { 'spec' }
  watch('spec/rails_helper.rb')   { 'spec' }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb"]
  end
  watch(%r{^spec/serializers/support/([^-]+)-(.+)\.json$}) do |m|
    "spec/serializers/#{m[1]}_serializer_spec.rb"
  end
  watch(%r{^spec/support/(.+)\.rb$})                  { 'spec' }
  watch(%r{^spec/support-files/(.+)\.rb$})            { 'spec' }
  watch(%r{^spec/support-files/ehmbr/([^-]+)(-[0-9]+)?\.json$}) do |m|
    [ "spec/fhir_resources/#{m[1]}_spec.rb",
      "spec/requests/fhir_api/#{m[1]}_api_spec.rb" ]
  end
  watch(%r{^spec/support-files/fhir/(.+)/.+\.json$})  { |m| "spec/views/fhir_#{m[1]}_view_spec.rb" }
  watch('config/routes.rb')                           { 'spec/routing' }
  watch('app/controllers/application_controller.rb')  { 'spec/controllers' }
  watch('app/lib/ehmbr_formatters.rb')                { 'spec/lib/ehmbr_formatters' }
  watch(%r{^app/lib/ehmbr/(.+)\.rb$})                 { 'spec/lib/deserializers' }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}_spec.rb" }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
end
