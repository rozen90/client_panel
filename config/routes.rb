Rails.application.routes.draw do 
  get 'welcome/index'
  get 'welcome/delit'
  devise_for :models
  root 'welcome#index'

end
