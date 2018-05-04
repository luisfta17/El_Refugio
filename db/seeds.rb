require_relative( "../models/type_of_animal.rb" )
require("pry-byebug")

doggo = Type_of_animal.new({
  "name" => "Doggo"
})

doggo.save()

cat = Type_of_animal.new({
  "name" => "Cat"
})

cat.save()


binding.pry
nil
