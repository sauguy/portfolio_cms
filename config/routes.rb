Rails.application.routes.draw do
  get 'admin', to: 'admin/portfolio#index'
  namespace :admin do
    resources :portfolio, except: :index
    resources :page, :block, :link
  end
end
