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
