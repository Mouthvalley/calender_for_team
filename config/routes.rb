Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    get "search" => "searches#search"
    get 'events/index'
    resources :events

    #unsubscribe：退会機能
    delete 'users/unsubscribe/:id' => 'users#unsubscribe', as: 'unsubscribe_user'
    get 'my_page' => 'users#index', as: 'my_page'
    get 'my_page/edit/:id' => 'users#edit', as: 'my_page_edit'
    resources :users, only: [:update] do
      resources :schedules do
        resources :schedule_shares, only: [:new, :create, :destroy]
      end
      resource :relationships, only: [:create, :destroy]
        member do
          get :followings, :followers
          post :create, :destroy
        end
    end
  end
end