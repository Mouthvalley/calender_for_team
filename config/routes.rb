Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}


  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'
    get "search" => "searches#search"

    #unsubscribe：退会機能
    delete 'users/unsubscribe/:id' => 'users#unsubscribe', as: 'unsubscribe_user'
    resources :users, only: [:update]
      get 'my_page' => 'users#index', as: 'my_page'
      get 'my_page/edit' => 'users#edit', as: 'my_page_edit'
    resources :schedules
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
