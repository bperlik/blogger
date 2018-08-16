Rails.application.routes.draw do

  root 'welcome#index'

  resources :posts, :only => [:new, :create, :show, :index]

  get "welcome/index"

  mount Whodat::Engine, at: '/whodat', :as => 'whodat'

end
