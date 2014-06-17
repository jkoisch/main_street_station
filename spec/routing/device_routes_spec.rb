require 'spec_helper'

describe 'FHIR Device' do
  describe 'provided routes' do

    specify { expect(get: fhir_Device_index_path).to route_to(controller: 'fhir/devices',
                                                               action:     'index',
                                                               format:     :json) }
    specify { expect(get: '/fhir/Device').to route_to(controller: 'fhir/devices',
                                                       action:     'index',
                                                       format:     :json) }
    specify { expect(get: fhir_Device_path(1)).to route_to(controller: 'fhir/devices',
                                                            action:     'show',
                                                            id:         '1',
                                                            format:     :json) }
    specify { expect(get: '/fhir/Device/1').to route_to(controller: 'fhir/devices',
                                                         action:     'show',
                                                         id:         '1',
                                                         format:     :json) }
    specify { expect(post: fhir_Device_index_path).to route_to(controller: 'fhir/devices',
                                                                action:     'create',
                                                                format:     :json) }
    specify { expect(post: '/fhir/Device').to route_to(controller: 'fhir/devices',
                                                        action:     'create',
                                                        format:     :json) }
    specify { expect(put: fhir_Device_path(1)).to route_to(controller: 'fhir/devices',
                                                            action:     'update',
                                                            id:         '1',
                                                            format:     :json) }
    specify { expect(put: '/fhir/Device/1').to route_to(controller: 'fhir/devices',
                                                         action:     'update',
                                                         id:         '1',
                                                         format:     :json) }
  end

  describe 'forbidden routes' do
    # the following routes matches the show path, not testable
    #specify { expect(get: '/fhir/Device/new').not_to be_routable }
    specify { expect(get: '/fhir/device').not_to be_routable }
    specify { expect(get: '/fhir/Devices').not_to be_routable }
    specify { expect(get: '/fhir/Devices/1').not_to be_routable }
    specify { expect(get: '/fhir/device/1').not_to be_routable }
    specify { expect(post: '/fhir/device').not_to be_routable }
    specify { expect(post: '/fhir/Devices').not_to be_routable }
    specify { expect(get: '/fhir/Device/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/Devices/edit/1').not_to be_routable }
    specify { expect(get: '/fhir/device/edit/1').not_to be_routable }
    specify { expect(delete: '/fhir/Device/1').not_to be_routable }
    specify { expect(delete: '/fhir/Devices/1').not_to be_routable }
    specify { expect(delete: '/fhir/device/1').not_to be_routable }
  end
end