Rails.application.routes.draw do
  get 'admin', to: 'admin/portfolios#index'
  namespace :admin do
    resources :portfolios, except: :index do
      resources :pages do
        resources :blocks do
          resources :elements
        end
      end
    end
  end
end
