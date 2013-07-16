FrayAcademicSystem::Application.routes.draw do

  #get "users/sign_in", to: "welcome#index"

  devise_for :users do

    get "/login" => "devise/sessions#new"
    get "users/sign_in" => "welcome#index"
    get "/logout" => "devise/sessions#destroy"

  end

  get "groups/manage", to: "groups#manage"
  get "teachers/manage", to: "teachers#manage"
  get "students/manage", to: "students#manage"
  get "lectures/manage", to: "lectures#manage"
  get "subjects/manage", to: "subjects#manage"
  get "institutions/manage", to: "institutions#manage"
  get "stages/manage", to: "stages#manage"
  get "periods/manage", to: "periods#manage"
  get "schedules/manage", to: "schedules#manage"

  get "grades/manage", to: "grades#manage"
  get "grades/manage/:id", to: "grades#manage"
  get "grades/manage/:id/:lecture_id", to: "grades#manage"
  get "grades/new/:student_id/:lecture_id", to: "grades#new_with_student"


  resources :lectures

  resources :records

  resources :schedules

  resources :stages

  resources :subjects

  resources :users

  resources :groups

  resources :grades

  resources :periods

  resources :institutions

  resources :teachers

  resources :students

  get "welcome/index"
  root to: "welcome#index"
end
