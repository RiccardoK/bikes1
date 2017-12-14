# Rails.application.routes.draw do
#   devise_for :users, skip: [:sessions]
# 	as :user do
# 	  get 'signin', to: 'devise/sessions#new', as: :new_user_session
# 	  post 'signin', to: 'devise/sessions#create', as: :user_session
# 	  match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
# 	end
	
#   resources :users
#   resources :products
#     resources :orders, only: [:index, :show, :create, :destroy, :new, :edit ]

#   get 'static_pages/about'

#   get 'static_pages/contact'

#   get 'static_pages/index'
#   root 'static_pages#landing_page'

#   post 'static_pages/thank_you'
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end
Rails.application.routes.draw do

devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  
  root 'static_pages#landing_page'
  
  resources :products do
  resources :comments
  end
   resources :orders
  resources :users
  resources :payments

  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/index'
  post 'static_pages/thank_you'
  post 'payments/create'
  get 'payments/create'
  get 'products/index'
  mount ActionCable.server => '/cable'

 # get '/products/:id', to: 'products#show'

  # default route
  # may go away in future versions of Rails
  # get ':controller (/:action (/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

