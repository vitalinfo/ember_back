Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'api/v1/sessions' }
  namespace :api do
    api_version(module: 'V1', path: { value: 'v1' }, defaults: { format: 'json' } ) do
      resources :users, only: [:create]
      resources :tasks, only: [:index]
    end
  end
end
