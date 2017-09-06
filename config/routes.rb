Rails.application.routes.draw do
  get "/sessions" => "sessions#destroy"
  resources :sessions, only: [:new, :create]
  resources :users
  resources :results
  resources :quizzes, except: [:destroy] do
    resources :questions do
      resources :answers
    end
  end
  root 'sessions#new'
end
