Airmelive::Application.routes.draw do


  root :to => 'users#index'

  get "index" => "users#index"
  post "new" => "users#new"
  get "public_profile/:id" => "users#public_profile", as: "public_profile"
  get "/login_details/:id" => "sessions#login_details", as: "login_details"
  patch "login_details/:id" => "sessions#update" , as: "update"
  get "profile/:id" => "sessions#profile", as: "profile"
  get "log_out" => "sessions#log_out"
  get "profile/:id/edit" => "sessions#edit", as:"edit"

  resources :sessions do
  end

  get '/admin', to: 'admins#index'
  get  '/admins/show', to: 'admins#show', as: 'show'
  post  '/admins/show/:id/delete', to: 'admins#delete', as: 'delete_event'
  post '/admins/:id/edit', to: 'admins#edit_event', as: 'edit_event'
  get '/admins/hangout_xml' , to: 'admins#hangout_xml'
  get 'admin/register_hangout',  to: 'admins#save_json_data'
  get 'admins/show/audition/:id', to: 'admins#audition', as: 'audition'
  #post 'send_fb_message/:id' => "admins#send_fb_message"
  resources :users
  resources :events
  resources :admins
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


# post '/upcomingevents', to: 'users#register'
#  patch "/admins", to: 'admins#send_fb_message'



  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  get '/upcomingevents', to: 'events#upcoming_events'
  post '/upcomingevents/:id', to: 'events#post_upcoming_events', as: "upcoming"
  get '/upcomingevents/:id/show', to: 'events#show_up', as: "upcoming_each"
  get '/ongoingevents', to: 'events#ongoing_events'
  get '/auditionevents', to: 'events#audition_events'
  get '/home', to: 'events#home'

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
