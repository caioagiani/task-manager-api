require 'api_version_constraint'

Rails.application.routes.draw do
  devise_for :users, only: [:sessions], controllers: { sessions: 'api/v1/sessions' }

  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, patch: '/'  do
    namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1) do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end

    namespace :v2, path: '/', constraints: ApiVersionConstraint.new(version: 2, default: true) do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :destroy]
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end

end
