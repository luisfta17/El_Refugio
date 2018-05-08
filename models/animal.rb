require("date")
require_relative("../db/sql_runner")
require_relative("./owner")
require_relative("./adopted_animal")
require_relative("./type_of_animal")

class Animal

  attr_accessor(:name, :type_id, :age, :admision_date, :picture, :adoptable, :adopted, :id)

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @type_id = options["type_id"]
    @age = options["age"].to_i
    @admision_date = options["admision_date"]
    @picture = options["picture"]
    @adoptable = options["adoptable"]
    @adopted = options["adopted"]
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type_id,
      age,
      admision_date,
      picture,
      adoptable,
      adopted
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING *"
    values = [@name, @type_id, @age, @admision_date, @picture, @adoptable, @adopted]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end


  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    animal_to_remove = SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      type_id,
      age,
      admision_date,
      picture,
      adoptable,
      adopted
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8"
    values = [@name, @type_id, @age, @admision_date, @picture, @adoptable, @adopted, @id]
    SqlRunner.run( sql, values )
  end

  def find_type()
    sql = "SELECT * FROM types_of_animals WHERE id = $1"
    values = [@type_id]
    type = SqlRunner.run(sql, values)
    result = Type_of_animal.new(type.first())
    return result.name
  end

  def check_adoptability_web() #when object comes back from db boolean is "t" or "f"
    if self.adoptable == "t" && self.adopted == "f"
      return true
    else
      return false
    end
  end

  def check_adopted_false()
    return self.adoptable == "f" && self.adopted == "f"
  end

  def check_adopted_true()
    return self.adoptable == "f" && self.adopted == "t"
  end

  def change_adoptability()
    @adopted = true
    @adoptable = false
    self.update()
  end

  def adopted_by(owner)
    if self.check_adoptability_web()
      self.change_adoptability
      adoption = {
        "animal_id" => self.id,
        "owner_id" => owner.id,
        "adoption_date" => Time.now.strftime("%Y-%m-%d")
      }
      new_adoption = Adopted_animal.new(adoption)
      new_adoption.save()
    end
  end

  def find_adoption_info()
    sql = "SELECT * FROM adopted_animals WHERE animal_id = $1"
    values = [@id]
    adoption_info = SqlRunner.run(sql, values)
    result = Adopted_animal.new(adoption_info.first())
    return result
  end

  def find_owner()
    sql = "SELECT owners.* FROM owners INNER JOIN adopted_animals ON owners.id = adopted_animals.owner_id WHERE adopted_animals.animal_id = $1 "
    values = [@id]
    owner = SqlRunner.run( sql, values )
    result = Owner.new( owner.first )
    return result
  end

  #CLASS METHODS

  def self.all()
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run( sql )
    result = animals.map { |animal| Animal.new( animal ) }
    return result
  end

  def self.find_by_adoptability(value)
    sql = "SELECT * FROM animals where adoptable = $1"
    values = [value]
    animals = SqlRunner.run( sql, values )
    result = animals.map { |animal| Animal.new( animal ) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    animal = SqlRunner.run( sql, values )
    result = Animal.new( animal.first )
    return result
  end

  def self.find_animals_by_type_id(id)
    sql = "SELECT * FROM animals WHERE type_id = $1"
    values = [id]
    animal_data = SqlRunner.run(sql, values)
    result = animal_data.map { |animal| Animal.new( animal ) }
    return result
  end

  def self.filter_for_adoptable(array)
    result = []
    for animal in array
      if animal.adoptable == "t"
        result.push(animal)
      end
    end
    return result
  end

  def self.filter_for_nonadoptable(array)
    result = []
    for animal in array
      if animal.adoptable == "f"
        result.push(animal)
      end
    end
    return result
  end

end
