Rails.application.routes.draw do

  root 'public_pages#index'

  #login
  get 'login' => 'sessions#new'
  post 'login'   => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'register' => 'users#new'
  post 'users' => 'users#create'

  get 'dashboard' => 'public_pages#dashboard'

  get 'clear_session' => 'public_pages#clear_session'


  get '/id/:public_id' => 'public_pages#public_id'
  get '/res/:custom_name' => 'public_pages#custom_name'
  post '/' => 'public_pages#create'
  patch '/' => 'public_pages#update'
  patch 'id/:public_id' => 'public_pages#update'
  put 'id/:public_id' => 'public_pages#update'


  get 'admin' => 'reservations#index'
  get 'variables'=> 'static_pages#variable_view'
  get 'seating_arrangements' => 'seating_arrangements#app', as: :seating_arrangements


  resources :reservations
  get 'reservations/email/:id' => 'reservations#email', as: :reservations_email
  get 'reservations/reset_email/:id' => 'reservations#reset_email', as: :reset_reservation_email
  get 'reservations/switch_attending/:id' => 'reservations#switch_attending', as: :switch_attending
  get 'reservations/switch_confirmed/:id' => 'reservations#switch_confirmed', as: :switch_confirmed



  get 'email_configurations/template/:id' => 'email_configurations#index', as: :email_configurations_template
  resources :email_configurations


  resources :meals
  resources :groups
  resources :customers

  resources :support_tickets do
    resources :support_comments
  end
  get 'support_tickets/close/:id' => 'support_tickets#close', as: :close_ticket


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
