xml.name {|xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.name)} unless resource.name.nil?
xml.valueQuantity({value: resource.value_quantity}) unless resource.value_quantity.nil?
xml.interpretation { |xml| xml << render('fhir/base/codeable_concept', codeable_concept: resource.interpretation)} unless resource.interpretation.nil?
xml.appliesDatetime({value: resource.applies_datetime}) unless resource.applies_datetime.nil?
xml.status({value: resource.status}) unless resource.status.nil?
xml.reliability({value: resource.reliability}) unless resource.reliability.nil?
xml.identifier { |xml| xml << render('fhir/base/identifier', identifier: resource.identifier)} unless resource.identifier.nil?
