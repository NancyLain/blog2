Rails.application.routes.draw do
  devise_for :users
  root 'microposts#index'

  #get 'microposts/:micropost_id/comments/:comment_id/edit/', to: 'comments#edit'

  resources :microposts do
      resources :comments
  end

  get 'results', to: 'results#index', as: 'results'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :user, only: [:edit, :show] do
    collection do
      patch 'update_password'
      patch 'update_profile'
    end
  end
  get 'users/index'
  get 'users/show_user'
  get 'users/edit_profile'
  resources :tags, only: [:index, :show]
  post 'users/set_role'
  get 'users/set_role'
end
