require 'rails_helper'

describe Fhir::CoveragesController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  context '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all coverages as @coverages' do
      get :index, format: :json
      expect(assigns(:coverages).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::CoveragesController.any_instance.stubs(:retrieve_file_resource).returns(nil)}

    it 'performs a coverage search for matching subscriber reference' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, 'subscriber' => '23'}
      expect(a_request(:get, 'gringotts.dev/coverages').
          with(:query => hash_including({'query' => {'subscriber' => {'value' => '23'}}}))).to have_been_made
    end
  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested coverage as @coverage' do
      get :show, id: 1, format: :json
      expect(assigns(:coverage)).to be_a(Fhir::Coverage)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

end