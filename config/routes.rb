Rails.application.routes.draw do
 root 'sims#index'

 resources :sims 
end
