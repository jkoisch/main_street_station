require 'rails_helper'

describe Fhir::CoveragesController, type: :controller do
  before(:each) { request.headers['Accept'] = 'application/fhir+json' }

  context '#index' do
    subject { get :index }

    specify { should render_template(:index) }

    it 'assigns all coverages as @coverages' do
      get :index
      expect(assigns(:coverages).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::CoveragesController.any_instance.stubs(:retrieve_file_resource).returns(nil)}

    it 'performs a coverage search for matching subscriber reference' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, params: {'subscriber' => '23'}
      expect(a_request(:get, 'gringotts.dev/coverages').
          with(:query => hash_including({'query' => {'subscriber' => {'value' => '23'}}}))).to have_been_made
    end
  end

  describe '#show' do
    subject { get :show, params: {id: 1} }

    specify { should render_template(:show) }

    it 'assigns the requested coverage as @coverage' do
      get :show, params: {id: 1}
      expect(assigns(:coverage)).to be_a(Fhir::Coverage)
    end

    it 'assigns the operation_outcome' do
      get :show, params: {id: 2}
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end

end