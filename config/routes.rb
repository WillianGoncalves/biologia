Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  resources :questions
  resources :great_themes, only: :index do
    resources :knowledge_objects, only: :index
  end

  resources :knowledge_objects, only: [] do
    resources :abilities, only: :index
  end

  resources :competences, only: :index
end
