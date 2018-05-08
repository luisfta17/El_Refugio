require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/adoptions_controller')
require_relative('controllers/animal_controller')
require_relative('controllers/owner_controller')
require_relative('controllers/user_controller')
require_relative('controllers/request_controller')

#WELCOME PAGE
get "/" do
  erb(:"welcome/index", :layout => :welcome_layout)
end
