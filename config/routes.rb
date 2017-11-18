Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'application#index'
   resources :attendees
   resources :courses
   resources :instructors

   resources :evaluations do
     get 'answers', on: :member
   end

   get '/attendees/:id/courses/edit', to: 'attendees#registration'

end
