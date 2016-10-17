Rails.application.routes.draw do
  devise_for :admins

  namespace :admins do
    resources :webcams, only: [:index] do
      collection do
        get 'delete_images'
        get 'video'
        get 'status'
        get 'security'
        post 'toggle'
      end
    end
  end

  namespace :api do
    resource :webcams, only: [:create] do
      collection do
        get 'contacts'
      end
    end
  end

  root 'home#index'
end
