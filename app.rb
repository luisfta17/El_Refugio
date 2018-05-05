require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/adopted_animal')
require_relative('./models/animal')
require_relative('./models/owner')
require_relative('./models/type_of_animal')


# ANIMALS

#READ all animals
get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
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
  erb(:"animals/new")
end

post "/animals" do
  @animal = Animal.new(params)
  @animal.save()
  erb (:"animals/create")
end

# UPDATE animal as non-adoptable

post "/animals/:id/nonadoptable" do
  @animal = Animal.find(params[:id])
  @animal.adoptable = false
  @animal.update()
  redirect "/animals"
end

# UPDATE animal as adoptable

post "/animals/:id/adoptable" do
  @animal = Animal.find(params[:id])
  @animal.adoptable = true
  @animal.update()
  redirect "/animals"
end


# OWNERS

#READ all owners
get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

# CREATE a new Owner
get "/owners/newowner" do
  @owners= Owner.all
  erb(:"owners/new")
end

post "/owners" do
  @owner = Owner.new(params)
  @owner.save()
  erb (:"owners/create")
end

#Delete Owner
post "/owners/:id/delete" do
  @owner = Owner.find(params[:id])
  @owner.delete()
  redirect "/owners"
end
