require_relative( "../models/type_of_animal.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")

Type_of_animal.delete_all()
Owner.delete_all()

doggo = Type_of_animal.new({
  "name" => "Doggo"
})

doggo.save()

cat = Type_of_animal.new({
  "name" => "Cat"
})

cat.save()

owner1 = Owner.new({
  "name" => "Luis Tejero",
  "contact_details" => "Luis@gmail.com"
})

owner1.save()

owner2 = Owner.new({
  "name" => "Andrea kspicy",
  "contact_details" => "Andrea@gmail.com"
})

owner2.save()


binding.pry
nil
