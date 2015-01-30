Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }

  root to: 'questions#index'
  resources :questions

  get '/me' => 'pages#me'
  get '/mycode' => 'pages#mycode'
  get '/exchanges' => 'pages#exchanges'
  get '/hobbies' => 'pages#hobbies'
  get '/education' => 'pages#education'
  get '/skills' => 'pages#skills'
  get '/work' => 'pages#work'
  get '/personal' => 'pages#personal'
  get '/websites' => 'pages#websites'
  get '/github' => 'pages#github'
  get '/travel' => 'pages#travel'
  get '/volunteer' => 'pages#volunteer'

end
