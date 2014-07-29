Rails.application.routes.draw do
  resources :usuarios

  resources :medicos

  get 'static/index'

  resources :centro_saluds

  root 'static#index', as: 'static'

  #Registro de Usuarios
  get '/medic_register/:id' => 'medicos#new', as: :registro_medico
  get '/centro_register/:id' => 'centro_saluds#new', as: :registro_centro
  get '/ad%/xas/159/qw%/:id' => 'usuarios#registro_inicio', as: :phase1
  get '/oq/q2s/2/qw%/:remember_token' => 'usuarios#pre_process', as: :pre_pro
  get '/usuarios/registro_inicio'
  get '/emailcheck/:id', to: 'static#emailcheck', as: :mailcheck

  #session
  post '/sessions/' => 'sessions#create', as: :sessions
  delete '/signout/' => 'sessions#destroy', as: :sessions_destroy
  get '/error/' => 'sessions#signin_error', as: :session_error
  match '/signin', to: 'sessions#signin', via: 'get'

  #Usuario
  get '/ajustes/:remember_token' => 'usuarios#ajustes', as: :ajustes
  get '/ajustes/mod_info_cuenta/:id' => 'usuarios#modificar_info', as: :modificar_info
  get '/austes/mod_info_cuenta/edit_nombre/:id' => 'usuarios#edit_nombre', as: :edit_nombre
  get '/mod_info_cuenta/' => 'static#info_cambiada', as: :info_cambiada

  #Medicos
  get '/new_servicios_medicos/:id' => 'medicos#registrar_servicios_medicos', as: :registrar_servicios_medicos
  get '/servicios_medicos/:id' => 'medicos#ver_servicios_medicos', as: :ver_servicios_medicos
  get '/editar_servicios_medicos/:id' => 'medicos#editar_servicios_medicos', as: :editar_servicios_medicos

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
