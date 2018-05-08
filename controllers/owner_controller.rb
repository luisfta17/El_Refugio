require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/adopted_animal')
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/type_of_animal')
require_relative('../models/user')
require_relative('../models/request')


# OWNERS

#READ all owners
get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

# CREATE a new Owner
get "/owners/new_owner" do
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
get "/owners/:id/edit" do
  @owner_to_update = Owner.find(params[:id])
  erb(:"owners/edit")
end

post "/owners/:id" do
  @owner_to_update = Owner.new(params)
  @owner_to_update.update()
  redirect "/owners"

end
