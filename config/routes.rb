Rails.application.routes.draw do
  devise_for :administrator

  namespace :admin do
    root "projects#index"

    resources :descriptions
    resources :features, param: :name
    resources :projects, param: :name
    resources :plans
    resources :packages, param: :name
    resources :technologies
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#home"

  get "feature/:name" => "features#show", as: :feature
  get "features" => "features#index", as: :features
  get "project/:name" => "projects#show", as: :project
  get "projects" => "projects#index", as: :projects
  get "technology/:name" => "technologies#show", as: :technology
end
