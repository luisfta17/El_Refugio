require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/adopted_animal')
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/type_of_animal')
require_relative('../models/user')
require_relative('../models/request')


# ANIMALS

#READ all animals
get '/animals' do
  @types = Type_of_animal.all
  if params[:type]
    @animals = Animal.find_animals_by_type_id(params[:type])
  else
    @animals = Animal.all()
  end
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

post "/animals/:id/non_adoptable" do
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

post "/animals/:id/set_owner/:ownerid" do
@animal = Animal.find(params[:id])
@owner = Owner.find(params[:ownerid])
@animal.adopted_by(@owner)
redirect "/adoptions"
end

# UPDATE existing animals
get "/animals/:id/edit" do
  @animal_to_update = Animal.find(params[:id])
  @types = Type_of_animal.all
  erb(:"animals/edit")
end

post "/animals/:id" do
  @animal_to_update = Animal.new(params)
  @animal_to_update.update()
  redirect "/animals"

end
