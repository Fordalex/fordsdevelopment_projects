Rails.application.routes.draw do
  devise_for :administrator

  namespace :admin do
    root "projects#index"
    resources :projects
    resources :features
    resources :technologies
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#home"
  get "project/:id" => "projects#show", as: :project
  get "technology/:name" => "technology#show", as: :technology
end
