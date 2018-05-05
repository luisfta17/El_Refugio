require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/adopted_animal')
require_relative('./models/animal')
require_relative('./models/owner')
require_relative('./models/type_of_animal')

#READ all animals
get '/animals' do
  @animals = Animal.all
  erb(:index)
end

#Delete Animal
post "/animals/:id/delete" do
  @animal = Animal.find(params[:id])
  @animal.delete()
  redirect "/animals"
end

# CREATE a new animal
get "/animals/new" do
  @animals= Animal.all
  @types = Type_of_animal.all
  erb(:new)
end

post "/animals" do
  @animal = Animal.new(params)
  @animal.save()
  erb (:create)
end
