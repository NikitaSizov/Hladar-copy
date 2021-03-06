Rails.application.routes.draw do

  resources :news, only: [:show, :index]
  root 'main_page#index'
  resources :products, only: [:show, :index]
  get '/news', to: "news#index"
  get '/news/:id', to: 'news#show'
  get '/smth', to: 'main_page#smth'
  scope :as => "admin" do
    resources :products, path: '/admin/products' do
      resources :offers, controller: "admin/offers", only: [:create, :update, :destroy]
      get '/form', to: 'admin/offers#form', as: 'offer_form'
    end
    resources :news, path: '/admin/news'
  end
  namespace :admin do
    root 'admin#admin'
    get 'orders/', to: 'orders#index'
    post 'orders/', to: 'orders#create'
    patch '/categories/:id', to: 'product_categories#update', as: :category
    get '/categories/', to: 'product_categories#index'
    get '/categories/new', to: 'product_categories#new'
    post '/categories/', to: 'product_categories#create'
    delete '/categories/:id', to: 'product_categories#destroy'
    get '/login', to: 'session#login', as: :login
    post '/auth', to: 'session#auth', as: :auth
    resources :sertificates
  end
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
