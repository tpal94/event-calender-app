Rails.application.routes.draw do
  devise_for :users
  resources :events do 
  	collection do
      get :my_calender
      get :my_events
    end

  end 
  root 'visitors#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
