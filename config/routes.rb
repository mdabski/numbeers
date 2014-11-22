Numbeers::Application.routes.draw do

  root 'pages#home'
  
  namespace :admin do
    resources :transactions
    resources :records
    resources :beers
    resources :kegs do
      member do
        post 'charge'
      end
    end
  end

  devise_for :users, controllers: { registrations: "registrations", confirmations: 'confirmations' }

  resources :transactions, only: :create
  
  get "/home" => "pages#home"
  get "/pour" => "pages#pour"
  get "/stats" => "pages#stats"
  get "/account" => "pages#account"
  get "/dashboard" => "pages#dashboard"
  
  get "/about" => "pages#about"
  get "/contact" => "pages#contact"
  post "/contact" => "pages#contact"
  post "/broadcast_message" => "actions#broadcast_message"
  
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
