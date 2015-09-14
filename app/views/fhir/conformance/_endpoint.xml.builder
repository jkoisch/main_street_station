xml.protocol{ |xml| xml << render('fhir/base/coding', {coding: endpoint.protocol})} unless endpoint.protocol.nil?
xml.address ({value: endpoint.address}) unless endpoint.address.nil?