Rails.application.routes.draw do
  namespace :v1 do
    get 'feed' => 'feeds#feed'
    resources :posts
    resources :ratings
    resources :comments
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
