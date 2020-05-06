Rails.application.routes.draw do
  
  # get '/*path' => 'home#index'

  root to: 'home#index'

  namespace :api do 
    namespace :v1 do 
      resources :movies, only: [:create, :index, :show ] do
      	get 'best_seat', on: :member
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
