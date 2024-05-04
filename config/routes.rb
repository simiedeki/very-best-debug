Rails.application.routes.draw do

get '/users', to: 'users#index'
get '/users/:username', to: 'users#show'
get '/', to: 'users#index'
get '/venues', to: 'venues#index'
get '/venues/:path_id', to: 'venues#show'
get '/delete_venue/:path_id', to: 'venues#delete'
get '/delete_venue/:path_id', to: 'venues#delete'
post("/add_user", { :controller => "users", :action => "create" })
post("/insert_venue_record", { :controller => "venues", :action => "create" })
post("/update_user/:path_id", { :controller => "users", :action => "update" })
post("/update_venue/:path_id", { :controller => "venues", :action => "update" })
post '/insert_comment_record', to: 'comments#create'
end
