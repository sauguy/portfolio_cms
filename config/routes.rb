Rails.application.routes.draw do
  get 'admin', to: 'admin#index'
  namespace :admin do
    resources :portfolio, :page, :block, :link
  end
end
