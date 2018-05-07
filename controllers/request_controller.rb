require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/adopted_animal')
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/type_of_animal')
require_relative('../models/user')
require_relative('../models/request')


#READ all users requests
get '/requests' do
  @requests = Request.all()
  erb(:"animals/requests")
end

# CREATE user animal Request

get "/users/animals/:id/set_user" do
  @animal = Animal.find(params[:id])
  @types = Type_of_animal.all
  @users = User.all
  erb(:"users/requests/set_user", :layout => :user_layout)
end

get "/users/animals/:id/set_user/:userid/set_comment" do
@animal = Animal.find(params[:id])
@user = User.find(params[:userid])
erb(:"users/requests/set_comment", :layout => :user_layout)
end

post "/users/animals/:id/set_user/:userid/requests" do
@animal = Animal.find(params[:id])
@user = User.find(params[:userid])
@user.create_request(@animal, params[:comment])
erb(:"users/requests/request_created", :layout => :user_layout)
end
