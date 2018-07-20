Rails.application.routes.draw do

  mount Whodat::Engine, at: '../whodat'

  resources :posts

  get "welcome/index"

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
