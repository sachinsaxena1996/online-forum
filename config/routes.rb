Rails.application.routes.draw do
  devise_for :users
  resources :questions do
  	resources :comments
  end

  root 'questions#index'
  
end
