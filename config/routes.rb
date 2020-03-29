# frozen_string_literal: true

Rails.application.routes.draw do
  get '*path', to: 'pages#index', constraints: ->(req) { req.path.exclude? 'storage' }
  root to: 'pages#index'
end
