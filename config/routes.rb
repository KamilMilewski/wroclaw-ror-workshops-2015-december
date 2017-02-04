Rails.application.routes.draw do
  get 'payments/index', as: :payments

  root 'visitors#index'
  devise_for :users
  resources :students do
    get :subjects
  end
  resources :teachers do
    get :subjects
  end
  get 'subjects', to: 'reports#subjects', as: :report_subjects
end
