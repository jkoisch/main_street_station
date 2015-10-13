module Fhir
  module Spec
    module Helpers
      def yaml_load(file_name, base_dir='spec/support-files/fhir/')
        YAML.load(File.read(base_dir + file_name))
      end

      def support_file(file_name)
        "spec/support-files/fhir/#{file_name}"
      end
    end
  end
end