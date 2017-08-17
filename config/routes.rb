Rails.application.routes.draw do
  # Routes for the Connection resource:
  # CREATE
  get "/connections/new", :controller => "connections", :action => "new"
  post "/create_connection", :controller => "connections", :action => "create"

  # READ
  get "/connections", :controller => "connections", :action => "index"
  get "/connections/:id", :controller => "connections", :action => "show"

  # UPDATE
  get "/connections/:id/edit", :controller => "connections", :action => "edit"
  post "/update_connection/:id", :controller => "connections", :action => "update"

  # DELETE
  get "/delete_connection/:id", :controller => "connections", :action => "destroy"
  #------------------------------

  root "conversations#index"
  
  # Routes for the Conversation resource:
  # CREATE
  get "/conversations/new", :controller => "conversations", :action => "new"
  post "/create_conversation", :controller => "conversations", :action => "create"

  # READ
  get "/conversations", :controller => "conversations", :action => "index"
  get "/conversations/:id", :controller => "conversations", :action => "show"

  # UPDATE
  get "/conversations/:id/edit", :controller => "conversations", :action => "edit"
  post "/update_conversation/:id", :controller => "conversations", :action => "update"

  # DELETE
  get "/delete_conversation/:id", :controller => "conversations", :action => "destroy"
  #------------------------------

  # Routes for the Message resource:
  # CREATE
  get "/messages/new", :controller => "messages", :action => "new"
  post "/create_message", :controller => "messages", :action => "create"

  # READ
  get "/messages", :controller => "messages", :action => "index"
  get "/messages/:id", :controller => "messages", :action => "show"

  # UPDATE
  get "/messages/:id/edit", :controller => "messages", :action => "edit"
  post "/update_message/:id", :controller => "messages", :action => "update"

  # DELETE
  get "/delete_message/:id", :controller => "messages", :action => "destroy"
  #------------------------------

  # Routes for the Wallet resource:
  # CREATE
  get "/wallets/new", :controller => "wallets", :action => "new"
  post "/create_wallet", :controller => "wallets", :action => "create"

  # READ
  get "/wallets", :controller => "wallets", :action => "index"
  get "/wallets/:id", :controller => "wallets", :action => "show"

  # UPDATE
  get "/wallets/:id/edit", :controller => "wallets", :action => "edit"
  post "/update_wallet/:id", :controller => "wallets", :action => "update"

  # DELETE
  get "/delete_wallet/:id", :controller => "wallets", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
