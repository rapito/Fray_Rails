FrayAcademicSystem::Application.routes.draw do

  devise_for :users

  get "grades/manage", to: "grades#manage"
  get "grades/manage/:id", to: "grades#manage"
  get "grades/manage/:id/:lecture_id", to: "grades#manage"

  get "grades/new/:student_id/:lecture_id", to: "grades#new_with_student"

  get "groups/manage", to: "groups#manage"
  get "lectures/manage", to: "lectures#manage"
  get "teachers/manage", to: "teachers#manage"
  get "students/manage", to: "students#manage"
  get "subjects/manage", to: "subjects#manage"
  get "institutions/manage", to: "institutions#manage"
  get "stages/manage", to: "stages#manage"
  get "periods/manage", to: "periods#manage"
  get "schedules/manage", to: "schedules#manage"


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

  #get "students", to: "users#index_students"
  #get "teachers", to: "users#index_teachers"


  get "welcome/index"
  root to: "welcome#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
