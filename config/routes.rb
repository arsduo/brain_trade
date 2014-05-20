BrainTrade::Application.routes.draw do
  
  get 'login' => 'sessions#new', :as => "new_session"
  post 'login' => 'sessions#create', :as => "login_sessions"
  get 'logout' => 'sessions#destroy', :as => "logout_sessions"
  match 'auth/:provider/callback', to: 'sessions#createoauth', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  get 'search' => 'categories#search'

  resources :users
 
  resources :categories, only: [:index, :show]
  resources :subjects, only: [:show]
  resources :offerings
  resources :meetups, except: [:index, :destroy]

  root to: "sessions#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
