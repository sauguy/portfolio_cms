# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admin', to: 'admin/portfolios#index'
  namespace :admin do
    resources :portfolios do
      resources :pages, shallow: true do
        resources :blocks, shallow: true do
          resources :elements, shallow: true
        end
      end
    end
  end
end
