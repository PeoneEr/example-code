Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        get :me, on: :collection
      end

      resources :feeds do
        member do
          put :refresh
        end

        resources :feed_items do
          member do
            put :hide
          end
        end
      end
    end
  end

  root to: 'application#index'
  get '/*path', to: 'application#index', format: false
end
