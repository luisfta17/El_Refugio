require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/adopted_animal')
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/type_of_animal')
require_relative('../models/user')
require_relative('../models/request')


# USER SIDE app

#READ all animals
get '/users/animals' do
  @animals = Animal.all()
  @adopteds = Adopted_animal.all()
  @owners = Owner.all()
  erb(:"users/animals/index", :layout => :user_layout)
end

#READ all animals ready for adoption
get '/users/animals/for_adoption' do
  @animals = Animal.all()
  erb(:"users/animals/for_adoption", :layout => :user_layout)
end

#READ all animals NOT ready for adoption
get '/users/animals/not_ready' do
  @animals = Animal.all()
  erb(:"users/animals/not_ready", :layout => :user_layout)
end

#READ animals by type
get '/users/animals/find' do
  @types = Type_of_animal.all
  erb(:"users/animals/find", :layout => :user_layout)
end

get '/users/animals/find/:id' do
  @animals = Type_of_animal.find_animals_by_type_id(params[:id])
  erb(:"users/animals/results", :layout => :user_layout)
end

# CREATE a new user
get "/users/new_user" do
  @users= User.all
  erb(:"users/users/new", :layout => :user_layout)
end

post "/users/new_user/created" do
  @user = User.new(params)
  @user.save()
  erb(:"users/users/created", :layout => :user_layout)
end

# UPDATE existing user
get "/users/edit" do
  @users = User.all
  erb(:"users/users/update", :layout => :user_layout)
end

get "/users/edit/:id" do
  @user_to_update = User.find(params[:id])
  erb(:"users/users/update_form", :layout => :user_layout)
end

post "/users/edit/:id" do
  @user_to_update = User.new(params)
  @user_to_update.update()
  redirect "/users/edit"
end
