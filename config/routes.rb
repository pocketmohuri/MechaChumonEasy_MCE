Rails.application.routes.draw do

  devise_for :customer_tables, controllers: {
      registrations: 'publilc/registrations',
      sessions: 'public/sessions'
  }

  devise_for :admins, controllers: {
  #   homes: "admin/homes",
      registrations: 'admin/registrations',
      sessions: 'admin/sessions'
  #   menues: "admin/menues",
  #   genres: "admin/genres",
  #   users: "admin/users",
  #   orders: "admin/orders",
  #   order_details: "admin/order_details"
  }

#mydomain.com/menues
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :menus, only:[:index, :show]
    resources :cart_items, only:[:new, :index, :create, :update, :destroy]
    resources :comments,  only:[:new, :create, :destroy]
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy', as: 'all_destroy_cart_items'
    resources :orders, only:[:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm', as: 'confirm_orders'
    get 'orders/complete' => 'orders#complete', as: 'complete_orders'
    resources :tables, only:[:new, :show]
    #tablesがながのケーキでいうcustomerテーブル。
  end

  get "admin" => "homes#top"
  namespace :admin do
    resources :menus, only:[:new, :index, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :users, only:[:new, :index, :create, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

