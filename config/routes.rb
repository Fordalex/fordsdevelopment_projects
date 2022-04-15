Rails.application.routes.draw do
  # TODO clean up, alphabetical.
  # TODO set params to use :name but these need a unique validation.
  devise_for :administrator

  namespace :admin do
    root "projects#index"
    resources :projects, param: :name
    resources :features
    resources :technologies
    resources :plans
    resources :packages, param: :name
    resources :descriptions
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#home"
  get "project/:name" => "projects#show", as: :project
  get "technology/:name" => "technologies#show", as: :technology
  get "feature/:name" => "features#show", as: :feature
end
