Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks

  patch '/tasks/:id/complete' => 'tasks#complete', as: 'task_complete'

  get '/auth/:provider/callback' => 'sessions#create'

  get '/auth/login' => 'sessions#login', as: 'login'

  delete "/logout", to: "sessions#logout", as: "logout"

end
