require_relative( "../models/type_of_animal.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/adopted_animal.rb" )
require("pry-byebug")

Type_of_animal.delete_all()
Owner.delete_all()
Animal.delete_all()
Adopted_animal.delete_all()

doggo = Type_of_animal.new({
  "name" => "Doggo"
})

doggo.save()

cat = Type_of_animal.new({
  "name" => "Cat"
})

cat.save()

deer = Type_of_animal.new({
  "name" => "Deer"
})

deer.save()

rabbit = Type_of_animal.new({
  "name" => "Rabbit"
})

rabbit.save()

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
  "admision_date" => "2018-04-02",
  "picture" => "/images/doggo1.png",
  "adoptable" => true,
  "adopted" => false
})

animal1.save()

animal2 = Animal.new({
  "name" => "Costilla",
  "type_id" => doggo.id,
  "age" => 3,
  "admision_date" => "2018-04-01",
  "picture" => "/images/doggo2.jpg",
  "adoptable" => true,
  "adopted" => false
})

animal2.save()

animal3 = Animal.new({
  "name" => "Snow",
  "type_id" => doggo.id,
  "age" => 1,
  "admision_date" => "2018-04-07",
  "picture" => "/images/doggo3.jpg",
  "adoptable" => false,
  "adopted" => true
})

animal3.save()

animal4 = Animal.new({
  "name" => "Arnold",
  "type_id" => cat.id,
  "age" => 3,
  "admision_date" => "2018-04-10",
  "picture" => "/images/arnolf.jpg",
  "adoptable" => false,
  "adopted" => false
})

animal4.save()

animal5 = Animal.new({
  "name" => "Bambi",
  "type_id" => deer.id,
  "age" => 1,
  "admision_date" => "2018-04-10",
  "picture" => "/images/bambi.jpg",
  "adoptable" => false,
  "adopted" => false
})

animal5.save()

animal6 = Animal.new({
  "name" => "Rocket",
  "type_id" => rabbit.id,
  "age" => 6,
  "admision_date" => "2018-04-11",
  "picture" => "/images/rocket.jpg",
  "adoptable" => false,
  "adopted" => false
})

animal6.save()

adoption1 = Adopted_animal.new({
  "animal_id" => animal3.id,
  "owner_id" => owner1.id,
  "adoption_date" => "2018-05-04"
})

adoption1.save()



binding.pry
nil
