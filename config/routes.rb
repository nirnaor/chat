Rails.application.routes.draw do
  resources :messages
  root to: "messages#index"
  get "refresh", to: "messages#refresh"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
