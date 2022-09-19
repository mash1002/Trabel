Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
  }
  devise_for :customers, controllers:{
    sessions: 'customers/sessions'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'

  end

  root "homes#top"

  namespace :admins do
    resources :customers, only: [:show, :index, :edit, :search, :create, :update, :destroy]
  end

  get "/", to: "homes#top"
  post '/customers/guest_sign_in', to: 'customers#guest_sign_in'


  resources :trips, only: [:index, :new, :show, :create, :edit, :update, :destroy, :search]do
  resource :favorites, only: [:index, :create, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  end
  resources :customers, only: [:show, :index, :edit, :search, :create, :update, :destroy] do
    collection do
      get 'search'
    end

    member do
      get :favorites
    end
  end


  resources :relations, only: [:create, :destroy]

  resources :admins, only: [:index, :edit, :create, :update, :destroy]
  # get 'admins/index'
  # get 'admins/edit'
  # get 'customers/index'
  # get 'customers/edit'
  # get 'customers/search'
  # get 'favorites/index'
  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'trips/index'
  # get 'trips/create'
  # get 'trips/edit'
  # get 'trips/update'
  # get 'trips/destroy'
  # get 'trips/search'
  # get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # resouces :items
  # get "/items", to: "items#index"
  # get "/items/:id", to: "items#show"
  # get "/items/new", to: "items#new"
  # post "/items", to: "items#create"
  # get "/items/:id/edit", to: "items#edit"
  # put "/items/:id", to: "items#update"
  # delete "/items/:id", to: "items#destroy"

  # get # デタ取得する
  # post #　デタを新規作成する
  # put/patch # デタを更新する
  # delete # デタを削除する

  # index get
  # new get
  # create post
  # show get
  # edit get
  # update put
  # destroy delete

end
