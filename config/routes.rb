Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}


  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'

    #unsubscribe：退会機能
    delete 'users/unsubscribe/:id' => 'users#unsubscribe', as: 'unsubscribe_user'
    resources :users, only: [:update]
      get 'my_page' => 'users#index', as: 'my_page'
      get 'my_page/edit' => 'users#edit', as: 'my_page_edit'
    #   collection do
    #     get 'edit_password'
    #     put 'update_password'
    #   end
    # end
    resources :schedules
  end
end
