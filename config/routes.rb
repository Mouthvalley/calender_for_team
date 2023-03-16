Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}


  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'

    # patch '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    resources :users, only: [:update]
    get 'users/my_page' => 'users#index', as: 'my_page'
    get 'users/my_page/edit' => 'users#edit', as: 'my_page_edit'
    # get '/users/confirm' => 'users#confirm'
  end



end
