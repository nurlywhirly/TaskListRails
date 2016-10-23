Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks

  patch '/tasks/:id/complete' => 'tasks#complete', as: 'task_complete'

  get '/auth/:provider/callback' => 'sessions#create'

  get '/session/login' => 'sessions#login', as: 'login'
  
  delete '/session/' => 'sessions#destroy', as: 'session_destroy'

end
