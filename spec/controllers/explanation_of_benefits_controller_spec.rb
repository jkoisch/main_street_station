require 'rails_helper'

describe Fhir::ExplanationOfBenefitsController, type: :controller do
  let(:json_headers) { { Accept: 'application/json', Content-Type => 'application/json' } }

  context '#index' do
    subject { get :index, format: :json }

    specify { should render_template(:index) }

    it 'assigns all eobs as @explanation_of_benefits' do
      get :index, format: :json
      expect(assigns(:explanation_of_benefits).count).to eq(1)
    end
  end

  context 'for searches' do
    before(:each) {Fhir::ExplanationOfBenefitsController.any_instance.stubs(:retrieve_file_resource).returns(nil) }

    it 'performs an explanation of benefit search for matching patient' do
      stub_request(:any, /.gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, 'patient' => '23'}
      expect(a_request(:get, 'gringotts.dev/explanation_of_benefits').
          with(:query => hash_including({'query' => {'patient' => {'value' => '23'}}}))).to have_been_made
    end

    it 'performs an explanation of benefit search for matching created' do
      stub_request(:any, /.*gringotts.dev\/.*/).to_return(:body => '[]')
      get :index, {format: :json, created: '2014-08-16'}
      expect(a_request(:get, 'gringotts.dev/explanation_of_benefits').
          with(:query => hash_including({'query' => {'created' => {'value' => '2014-08-16'}}}))).to have_been_made
    end

    it 'returns operation_outcome using invalid search criteria'
  end

  describe '#show' do
    subject { get :show, id: 1, format: :json }

    specify { should render_template(:show) }

    it 'assigns the requested explanation_of_benefit as @explanation_of_benefit' do
      get :show, id: 1, format: :json
      expect(assigns(:explanation_of_benefit)).to be_a(Fhir::ExplanationOfBenefit)
    end

    it 'assigns the operation_outcome' do
      get :show, id: 2, format: :json
      expect(assigns(:operation_outcome)).to be_a(Fhir::OperationOutcome)
    end
  end
end