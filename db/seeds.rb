require_relative( "../models/type_of_animal.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/animal.rb" )
require_relative( "../models/adopted_animal.rb" )
require_relative( "../models/user.rb" )
require_relative( "../models/request.rb" )
require("pry-byebug")

Type_of_animal.delete_all()
Owner.delete_all()
Animal.delete_all()
Adopted_animal.delete_all()
User.delete_all()
Request.delete_all()

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

elf = Type_of_animal.new({
  "name" => "Elf"
})

elf.save()

demodog = Type_of_animal.new({
  "name" => "DemoDog"
})

demodog.save()

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

owner3 = Owner.new({
  "name" => "Dustin Henderson",
  "contact_details" => "Dustin@upsidedown.com"
})

owner3.save()

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

animal7 = Animal.new({
  "name" => "Dobby",
  "type_id" => elf.id,
  "age" => 78,
  "admision_date" => "2018-05-10",
  "picture" => "/images/DOBBY2.jpg",
  "adoptable" => false,
  "adopted" => false
})

animal7.save()

animal8 = Animal.new({
  "name" => "Dart",
  "type_id" => demodog.id,
  "age" => 1,
  "admision_date" => "2018-02-10",
  "picture" => "/images/dart.jpg",
  "adoptable" => false,
  "adopted" => true
})

animal8.save()

adoption1 = Adopted_animal.new({
  "animal_id" => animal3.id,
  "owner_id" => owner1.id,
  "adoption_date" => "2018-05-04"
})

adoption1.save()

adoption2 = Adopted_animal.new({
  "animal_id" => animal8.id,
  "owner_id" => owner3.id,
  "adoption_date" => "2018-05-04"
})

adoption2.save()

user1 = User.new({
  "name" => "Maria Thompson",
  "contact_details" => "maria_thompson@gmail.com"
})

user1.save()

user2 = User.new({
  "name" => "Lele lolas",
  "contact_details" => "lele@gmail.com"
})

user2.save()

request1 = Request.new({
  "user_id" => user1.id,
  "animal_id" => animal6.id,
  "comment" => "I want this animal because looks awesome"
})

request1.save()


binding.pry
nil
