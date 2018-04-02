Rails.application.routes.draw do
  get 'admin', to: 'admin#index'
  namespace :admin do
    resources :page, :block, :link
  end
end
