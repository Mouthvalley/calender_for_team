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
    get 'users/my_page' => 'users#index', as: 'my_page'
    get 'users/my_page/edit' => 'users#edit', as: 'my_page_edit'

    resources :schedules
    # , only: [:new, :create, :edit, :update, :set_schedule]
  end



end
