Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"

   resources :attendees do
     collection {post :import}
   end

  #  devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }




   resources :attendees do
     resources :evaluations do
       get 'answers', on: :member
     end
   end

   resources :courses do
     collection {post :import}
   end

   resources :courses do
     resources :attendees do
       resource :download, only: [:show]
     end
   end


   resources :instructors
   resources :questions

   resources :evaluations do
     get 'answers', on: :member
   end

   resources :finished_evaluations do
     get 'answers', on: :member
   end

   resources :evaluations
  #  get '/attendees/:id/courses/edit', to: 'attendees#registration'
   #post '/attendees/:id/courses/edit' to: 'attendees#update'

end
