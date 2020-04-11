# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :volunteers, only: %i[create]
    resources :helps, only: %i[index show create]
  end

  get '*path', to: 'pages#index', constraints: ->(req) { req.path.exclude? 'storage' }
  root to: 'pages#index'
end
