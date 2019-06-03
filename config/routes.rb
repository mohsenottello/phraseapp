Rails.application.routes.draw do
  resources :articles
  resources :questions, except: [:show, :index]
  resources :answers, except: [:show, :index]
end
