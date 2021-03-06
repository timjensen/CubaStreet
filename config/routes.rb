CubaStreet::Application.routes.draw do
  
  get "users/new"

  root :to => 'pages#show', :id => '1'
  match 'home', :to => 'pages#show', :id => '1'
  match 'productpage', :to => 'products#showprod'
  match 'staffmembers', :to => 'staffs#showstaff'
  match 'contact', :to => 'pages#show', :id => '4'
  match 'admin/home', :to => 'pages#edit', :id => '1'
  match 'admin/contact', :to => 'pages#edit', :id => '4'
  match 'admin/products', :to => 'products#index'
  match 'admin/procreate', :to => 'products#new'
  match 'admin/proedit', :to => 'products#edit'
  match 'admin/staff', :to => 'staffs#index'
  match 'admin/staffedit', :to => 'staffs#edit'
  match 'admin/staffcreate', :to => 'staffs#new'
  match 'admin/proupload', :to => 'uploads#new'
  match 'admin/login', :to => 'sessions#new'
  match 'admin/logout', :to => 'sessions#destroy', via: :delete
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :uploads, only: [:new, :create]
  resources :pages, only: [:update]
  resources :staffs, only: [:destroy, :update, :edit, :create]
  resources :products, only: [:destroy, :update, :edit, :create] do
    member do 
    put 'specup'
    put 'specdown'
  end
  end
 
  
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
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
