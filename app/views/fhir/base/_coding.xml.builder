xml.system({value: coding.system}) unless coding.system.nil?
xml.version({value: coding.version}) unless coding.version.nil?
xml.code({value: coding.code}) unless coding.code.nil?
xml.display({value: coding.display}) unless coding.display.nil?
xml.primary({value: coding.primary}) unless coding.primary.nil?

xml.valueSet { |xml| xml << render('fhir/base/resource_reference', {resource_reference: coding.value_set}) } unless coding.value_set.nil?
