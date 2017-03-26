Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  root 'static_pages#home'


  #get 'microposts/:micropost_id/comments/:comment_id/edit/', to: 'comments#edit'

  resources :microposts do
      resources :comments
  end

  get 'results', to: 'results#index', as: 'results'


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
