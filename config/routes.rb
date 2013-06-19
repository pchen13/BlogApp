Blog::Application.routes.draw do
  namespace :mercury do
    resources :images
  end

  mount Mercury::Engine => '/'

  devise_for :users
  
  root :to => 'home#index'
  
  resources :users, :path => '/blog' do
      member do
          get 'rate/:score', :action => 'rate'
          get 'vote/:direction', :action => 'vote', :as => 'vote'
          get 'get_vote_up'
          get 'get_vote_down'
          get 'get_rating'
          get 'visits'
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
          post 'reply'
      end
      collection do
          get 'search', :action => 'search'
      end
  end
  resources :comments do
    member do
      get 'get_vote_up'
      get 'get_vote_down'
      get 'vote/:direction', :action => 'vote'
    end
  end
  
end
