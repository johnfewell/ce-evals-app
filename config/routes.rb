Rails.application.routes.draw do

  root to: "application#index"

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

   resources :users do
     patch 'update_role', on: :member
     get 'assign_role', on: :member
   end

   resources :attendees do
     collection {post :import}
     resources :evaluations do
       get 'answers', on: :member
     end
   end

   resources :courses do
     collection {get :finished}
     get 'report', on: :member
     collection {post :import}
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

end
