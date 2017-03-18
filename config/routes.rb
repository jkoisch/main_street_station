MainStreetStation::Application.routes.draw do

  #match 'auth/:provider/callback', to: 'omniauth_callbacks#create'
  #match 'auth/failure', to: redirect('/')
  #match 'logout', to: 'omniauth_callbacks#destroy', as: 'logout'

  namespace :fhir do
    #resources :Patients, :Patient, :patient, :patients,
    #          :controller => "patients",
    #          :as => "patients",
    #          :only => [:index, :show],
    #          :default => {:format=> :xml},
    #          :constraint => [{ :id => /^(@\d[1,36]+$)/}, { :protocol => "http" }] do
    #end

    #noinspection RailsParamDefResolve,RailsParamDefResolve
    resources :Condition, controller: 'conditions',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :Conformance, controller: 'conformance', as: 'conformance',
              only: [:index, :show], defaults: {format: :json}
    resources :Coverage, controller: 'coverages',
              only: [:index, :show], defaults: {format: :json}
    resources :Device, controller: 'devices',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :ExplanationOfBenefit, controller: 'explanation_of_benefits',
              only: [:index, :show], defaults: {format: :json}
    resources :FamilyMemberHistory, controller: 'family_member_histories',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :Location, controller: 'locations',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :Observation, controller: :observations,
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :Organization, controller: 'organizations',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :Patient, controller: 'patients',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :Questionnaire, controller: 'questionnaires',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :Practitioner, controller: 'practitioners',
              only: [:index, :show, :create, :update], defaults: {format: :json}
    resources :operation_outcomes, only: [:show], defaults: {format: :json}

    get 'metadata', to: 'conformance#show', defaults: {format: :json}
  end

  namespace :trust do
    get 'authentication', to: 'authentication#index'
    get 'authentication/:id', to: 'authentication#show'
  end

  namespace :authenticate do
    post 'facebook', to: 'facebook#create', defaults: {format: :json}
    # post 'google', to: 'google#create'
  end

  namespace :user do
    resources :registrations
    resources :sessions, only: [:new, :create, :delete]
    get 'sign_up', to: 'registrations#new'
    resources :passwords
    resources :oauth_sessions, only: [:new]
  end

  post 'login', to: 'user/api_sessions#create', defaults: {format: :json}
  delete 'logout', to: 'user/api_sessions#destroy'

  post '/api_session', to: 'user/api_sessions#create', defaults: {format: :json}
  delete '/api_session', to: 'user/api_sessions#destroy'

  root 'welcomes#index'

=begin
  namespace :registration do
    resources :whitelabel_groups
    resources :whitelabels
    resources :contracts
  end

  resources :whitelabel_groups

  match "/yellow_pages" => YellowPages, :anchor => false

  namespace :directory do
    resources :communities do
      resources :community_roles
    end
    resources :parties
    resources :youcentric_objects
    resources :services do
      resources :youcentric_operations
      resources :youcentric_interfaces
    end
    resources :community_role_kinds
    resources :verbs
  end

=end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.htmlx.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
