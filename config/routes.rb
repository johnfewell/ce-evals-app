Rails.application.routes.draw do

  root to: "application#index"

  devise_for :users, controllers: { sessions: 'sessions', omniauth_callbacks: 'users/omniauth_callbacks' }, skip: [:sessions]
  as :user do
    get 'users/sign_in' => 'sessions#new', :as => :new_user_session
    post 'users/sign_in' => 'sessions#create', :as => :user_session
    get 'users/sign_out' => 'sessions#destroy', :as => :destroy_user_session
  end

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
