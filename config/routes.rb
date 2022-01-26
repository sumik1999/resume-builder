Rails.application.routes.draw do
  root   'home#index'
  get    'experiences/:id/projects/new'   => 'projects#new'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get   'register' => 'register#register'
  post  'register' => 'register#create'
  resources :profiles , only: [:update]
  resources :educations , only: [:new]
  resources :experiences, only: [:new]
end
