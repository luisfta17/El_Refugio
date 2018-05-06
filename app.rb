require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/adopted_animal')
require_relative('./models/animal')
require_relative('./models/owner')
require_relative('./models/type_of_animal')

#WELCOME PAGE
get "/" do
  erb(:"welcome/index", :layout => :welcome_layout)
end

# ANIMALS

#READ all animals
get '/animals' do
  @animals = Animal.all()
  @adopteds = Adopted_animal.all()
  @owners = Owner.all()
  erb(:"animals/index", :layout => :layout)
end

#READ animals by type
get '/animals/find' do
  @types = Type_of_animal.all
  erb(:"animals/find")
end

get '/animals/find/:id' do
  @animals = Type_of_animal.find_animals_by_type_id(params[:id])
  erb(:"animals/results")
end

#READ all animals ready for adoption
get '/animals/for_adoption' do
  @animals = Animal.all()
  erb(:"animals/for_adoption")
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

# UPDATE animal SET OWNER

get "/animals/:id/set_owner" do
  @animal = Animal.find(params[:id])
  @types = Type_of_animal.all
  @owners = Owner.all
  erb(:"animals/set_owner")
end

post "/animals/:id/set_owner/:ownerid/created" do
@animal = Animal.find(params[:id])
@owner = Owner.find(params[:ownerid])
@animal.adopted_by(@owner)
redirect "/adoptions"
end

# UPDATE existing animals
get "/animals/:id/update" do
  @animal_to_update = Animal.find(params[:id])
  @types = Type_of_animal.all
  erb(:"animals/update")
end

post "/animals/:id/updated" do
  @animal_to_update = Animal.new(params)
  @animal_to_update.update()
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

# UPDATE existing owners
get "/owners/:id/update" do
  @owner_to_update = Owner.find(params[:id])
  erb(:"owners/update")
end

post "/owners/:id/updated" do
  @owner_to_update = Owner.new(params)
  @owner_to_update.update()
  redirect "/owners"

end


# Adoptions
get "/adoptions" do
  @adopteds = Adopted_animal.all
  erb(:"adoptions/index")
end
