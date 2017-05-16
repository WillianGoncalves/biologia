Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "questions#index"
  resources :questions

  resources :disciplines do
    resources :great_themes, only: :index
  end

  resources :great_themes, only: [:index, :new, :create] do
    resources :knowledge_objects, only: :index
  end

  resources :knowledge_objects, only: [:index, :new, :create] do
    resources :abilities, except: :show
  end

  resources :competences, only: :index

  resources :tests, only: [:index, :new]

  get 'questions_by_discipline/:discipline_id', to: 'questions#questions_by_discipline'
end
