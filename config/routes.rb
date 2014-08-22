Rssjournal::Application.routes.draw do
  get "comments/create"

  get "sessions/create"

  get "sessions/destroy"

  get "readers/index"

  get "readers/show"

  get "readers/new"

  get "readers/edit"

  get "stories/index"

  get "stories/show"

  get "stories/new"

  get "stories/edit"

  # The priority is based upon order of creation:
  # first created -> highest priority.
  root :to => "stories#index"
  resources :readers
  resources :sessions, only: [:destroy, :create]
  resources :stories do
    resources :comments
  end

# Google OmniAuth
  get 'google/create'
  get 'google/destroy'
  get 'auth/:provider/callback', to: 'google#create'
  get 'auth/failure', to: redirect('/')
  get 'gsignout', to: 'google#destroy', as: 'gsignout'

  resources :google, only: [:create, :destroy]


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
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
