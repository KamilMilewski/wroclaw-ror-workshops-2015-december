Rails.application.routes.draw do
  root 'visitors#index'
  devise_for :users
  resources :students do
    get :subjects
  end
  resources :teachers
  get 'subjects', to: 'reports#subjects'
end
