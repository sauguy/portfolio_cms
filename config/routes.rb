Rails.application.routes.draw do
  get 'admin', to: 'admin/portfolios#index'
  namespace :admin do

    resources :portfolios
    resources :pages
    resources :blocks
    resources :elements
  end
end
