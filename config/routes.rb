Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'public/homes#top'

  namespace :admin do
    get 'admin/new', to: 'admin/sessions#new'
      resources :customers do
      end
      resources :movies do
      end
  end
   

  namespace :public do
  get "session"       => "customers#session_form"
  post "session"    => "customers#session"
  post "sessionout"   => "customers#sessionout"
    resources :customers do
      resources :notifications,only: [:index]
        resources :relationships, only: [:create, :destroy] do
          get 'followings' => 'relationships#followings', as: 'followings'
          get 'followers' => 'relationships#followers', as: 'followers'
          get 'matchers'  => 'relationships#matchers', as:'matchers'
        end
        collection do
          get 'customers/leave' => 'customers#leave'
          patch 'customers/out' => 'customers#out'
        end
    end
    resources :movies do
      resources :movies_comment
    end
  end
end
