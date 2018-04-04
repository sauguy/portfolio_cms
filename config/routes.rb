Rails.application.routes.draw do
  get 'admin', to: 'admin/portfolios#index'
  namespace :admin do
    resources :pages, only: :index
    resources :portfolios, except: :index do
      resources :pages, shallow: true do
        resources :blocks do
          resources :elements
        end
      end
    end
  end
end
