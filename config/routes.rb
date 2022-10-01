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
    resources :technology_types
    resources :technology_types
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#home"

  get "feature/:name" => "features#show", as: :feature
  get "features" => "features#index", as: :features
  get "project/:name" => "projects#show", as: :project
  get "projects" => "projects#index", as: :projects
  get "technology/:name" => "technologies#show", as: :technology
  get "packages" => "packages#index", as: :packages
  get "dashboard" => "dashboard#dashboard", as: :dashboard

  # feed for learning spanish
  get "/spanish-feed" => "spanish#feed", defaults: {format: :json}

  draw :quiz
end
