require_relative( "../models/type_of_animal.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/adopted_animal.rb" )
require("pry-byebug")

Type_of_animal.delete_all()
Owner.delete_all()
Animal.delete_all()

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

animal1 = Animal.new({
  "name" => "Nano",
  "type_id" => doggo.id,
  "age" => 8,
  "admision_date" => "2018-05-01",
  "picture" => "https://static.postize.com/images/SIvGTliytXrD_3580.png",
  "adoptable" => true,
  "adopted" => false
})

animal1.save()

animal2 = Animal.new({
  "name" => "Costilla",
  "type_id" => doggo.id,
  "age" => 3,
  "admision_date" => "2018-04-01",
  "picture" => "https://static.postize.com/images/SIvGTliytXrD_3580.png",
  "adoptable" => true,
  "adopted" => false
})

animal2.save()

adoption1 = Adopted_animal.new({
  "animal_id" => animal1.id,
  "owner_id" => owner1.id,
  "adoption_date" => "2018-05-04"
})

adoption1.save()



binding.pry
nil
