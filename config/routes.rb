Rails.application.routes.draw do
  root  'hello#index'  #この1行を追加

  get 'todo/new', to: "todolists#new"
  post "todo/create", to: "todolists#create"
  get "todo/index", to: "todolists#index"

  # as以下をurlとして指定できる
  get "todo/:id", to: "todolists#show", as: 'todolist'
  get "todo/:id/edit", to: "todolists#edit", as: 'edit_todolist'
  patch 'todo/:id', to: 'todolists#update', as: 'update_todolist'
  delete 'todo/:id', to: 'todolists#destroy', as: 'destroy_todolist'

  get 'hello/index', to: 'hello#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'hello/create', to: 'hello#create'
end
