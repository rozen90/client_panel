Rails.application.routes.draw do

  get 'welcome/index'
  devise_for :models
  root 'welcome#index'

end
