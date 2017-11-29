Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#   root 'application#index'
   resources :attendees do
     collection {post :import}
   end
  #  resources :attendees
   resources :courses do
     collection {post :import}
   end

   resources :instructors
   resources :questions

  #  resources :evaluations do
  #    get 'answers', on: :member
  #  end

resources :evaluations
  #  get '/attendees/:id/courses/edit', to: 'attendees#registration'
   #post '/attendees/:id/courses/edit' to: 'attendees#update'

end
