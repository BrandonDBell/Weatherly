Weatherly::Application.routes.draw do
  root :to => 'pages#index'
  devise_for :users
  resources :users, :only => [:show]
  get "pages/index"
  get "pages/about"
  match 'hourly',  to: "hourly#hourly"
  match 'hourly_show', to: "hourly#hourly_show"
  match 'forecast',  to: "forecast#forecast"
  match 'forecast_show', to: "forecast#forecast_show"
  match 'satellite',  to: "satellite#satellite"
  match 'satellite_show', to: "satellite#satellite_show"
  match 'planner',  to: "planner#planner"
  match 'planner_show', to: "planner#planner_show"
  match 'about', to: "pages#about"
  match 'almanac', to: "almanac#almanac"
  match 'almanac_show', to: "almanac#almanac_show"
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
