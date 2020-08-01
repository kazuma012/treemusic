Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admin/admins/sessions', 
									  	registrations: 'admin/admins/registrations', 
									  	passwords: 'admin/admins/passwords' }
  devise_for :users, controllers: { sessions: 'public/users/sessions',
                                       registrations: 'public/users/registrations', 
                                       passwords: 'public/users/passwords' }
  namespace :public do
    get 'home/top'
    get 'home/about'
  end
  root 'public/home#top'
  namespace :public do
  	resource :user
  	get 'users/quit/:id' => 'users#quit'
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
    resources :tracks
    resources :blogs do
      resource :favorites, only: [:create, :destroy]
      resources :blogs_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
