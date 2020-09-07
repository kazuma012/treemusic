Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admin/admins/sessions' }
  devise_for :users, controllers: { sessions: 'public/users/sessions',
                                       registrations: 'public/users/registrations', 
                                       passwords: 'public/users/passwords' }
  namespace :admin do
    get 'homes/top'
  end

  namespace :public do
    get 'home/top'
    get 'home/about'
    get 'home/terms'
  end
  root 'public/home#top'
  namespace :public do
  	resources :users
    get "search" => "users#search"
  	get 'users/quit/:id' => 'users#quit'
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
    resources :tracks do
      resource :favorites, only: [:create, :destroy]
    end
    resources :blogs do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :admins
    get "search" => "users#search"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :blogs, only: [:index, :show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
