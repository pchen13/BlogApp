Blog::Application.routes.draw do
  devise_for :users
  
  root :to => 'home#index'
  match '/get_counter' => 'posts#counter'
  # match '/login' => 'users/sign_in', :as => 'login'
  # match '/logout' => 'users/sign_out', :as => 'logout'
  # match '/signup' => 'users/sign_in', :as => 'signup'
  
  # was used for blog per user
  resources :users do
      member do
          get 'rate', :action => 'rating'
          post 'rate', :action => 'save_rating'
      end
      resources :posts do
          member do
              get 'upload'
              post 'upload', :action => 'upload_process'
          end
      end
  end
  resources :posts do
      member do
          # get 'upload'
          # post 'upload', :action => 'upload_process'
          post 'reply'
      end
      collection do
          get 'search'
      end
  end
end
