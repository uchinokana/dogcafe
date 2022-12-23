Rails.application.routes.draw do
  
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  root to: "public/homes#top"
  get 'about' => 'public/homes#about', as: 'about'

  get 'unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw',as: 'withdraw'



  get 'admin' => 'admin/homes#top'

  namespace :public do

    devise_for :customers
    get "about" => "homes#about"
    resources :items, only: [:index,:show]
    resources :cart_items, only: [:index,:update,:destroy,:create,:all_destroy]
    resources :orders, only: [:new,:confirm,:complete,:create,:index,:show]
    post "orders/confirm" => "orders#confirm", as: "confirm"
    get "complete" => "orders#complete", as: "complete"
    resources :deliveries, only: [:index,:edit,:create,:update,:destroy]
    resources :customers, only: [:show,:edit,:update]
    resources :sessions, only: [:new,:create,:destroy]
    resources :addresses, only: [:index, :edit,  :create, :update, :destroy]
  end
  namespace :admin do

    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show,:update]
    resources :orders_status, only: [:update]
    resources :items, only: [:index,:new,:create,:show,:edit,:update]
    resources :sessions, only: [:new,:create,:destroy]
  end

end


    #namespace :public do
   # get 'deliveries/index'
    #get 'deliveries/edit'
    #get 'deliveries/create'
    #get 'deliveries/update'
   # get 'deliveries/destroy'
  #end
  #namespace :public do
    #get 'orders/new'
   # get 'orders/confirm'
   # get 'orders/complete'
    #get 'orders/create'
    #get 'orders/index'
    #get 'orders/show'
  #end
  #namespace :public do
    #get 'cart_items/index'
    #get 'cart_items/update'
    #get 'cart_items/destroy'
    #get 'cart_items/all_destroy'
    #get 'cart_items/create'
  #end
  #namespace :public do
    #get 'customers/show'
    #get 'customers/edit'
    #get 'customers/update'
    #get 'customers/unsubscribe'
    #get 'customers/withdraw'
  #end
  #namespace :public do
    #get 'sessions/new'
    #get 'sessions/create'
    #get 'sessions/destroy'
  #end
  #namespace :public do
    #get 'registrations/new'
   # get 'registrations/create'
  #end
  #namespace :public do
    #get 'items/index'
    #get 'items/show'
  #end

  #namespace :admin do
    #get 'orders/show'
    #get 'orders/update'
  #end
  #namespace :admin do
   # get 'customers/index'
    #get 'customers/show'
    #get 'customers/edit'
    #get 'customers/update'
  #end
  #namespace :admin do
    #get 'genres/index'
    #get 'genres/create'
    #get 'genres/edit'
    #get 'genres/update'
  #end
  #namespace :admin do
   # get 'items/index'
   # get 'items/new'
   # get 'items/create'
   # get 'items/show'
   # get 'items/edit'
    #get 'items/update'
  #end
 # namespace :admin do
   # get 'homes/top'
  #end
  #namespace :admin do
    #get 'sessions/new'
    #get 'sessions/create'
    #get 'sessions/destroy'
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

