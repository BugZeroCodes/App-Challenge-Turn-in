Rails.application.routes.draw do
  resources :teachers
  devise_for :students
  resources :schools

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'schools#index'
end
