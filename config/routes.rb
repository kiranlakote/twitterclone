Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :tweeets do
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweeets#index"
end
