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
    get 'my_page' => 'users#index', as: 'my_page'
    get 'my_page/edit' => 'users#edit', as: 'my_page_edit'
    resources :users, only: [:update] do
      resource :relationships, only: [:create, :destroy]
    end

    resources :schedules
  end
end
