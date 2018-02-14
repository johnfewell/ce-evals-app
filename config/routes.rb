Rails.application.routes.draw do

  root to: "application#index"

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'admin', to: 'admin#index'


  # resources :users, :only => [:index, :update] do
  #   get :me, on: :collection
  # end


   resources :users do
     patch 'update_role', on: :member
     get 'assign_role', on: :member
      collection do
        get 'unassigned'
      end
   end

   resources :attendees do
     collection {post :import}
     get 'profile', on: :member
     resources :evaluations do
       get 'answers', on: :member
     end
   end

   resources :courses do
     collection {get :finished}
     collection {get :draft}
     collection {get :current}
     collection {get :upcoming}
     get 'report', on: :member
     collection {post :import}
     resources :attendees do
       resource :download, only: [:show]
     end
   end

   resources :instructors do
     get 'profile', on: :member
   end

   resources :questions

   resources :evaluations do
     collection {get :assigned}
     collection {get :unassigned}
     get 'answers', on: :member
   end

   resources :finished_evaluations do
     get 'answers', on: :member
   end

end
