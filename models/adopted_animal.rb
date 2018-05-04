require_relative("../db/sql_runner")

class Adopted_animal

  attr_accessor(:animal_id, :owner_id, :adoption_date, :id)

  def initialize(options)
    @id = options["id"].to_i
    @animal_id = options["animal_id"].to_i
    @owner_id = options["owner_id"].to_i
    @adoption_date = options["adoption_date"]
  end

  def save()
    sql = "INSERT INTO adopted_animals
    (
      animal_id,
      owner_id,
      adoption_date
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@animal_id, @owner_id, @adoption_date]
    adoption_data = SqlRunner.run(sql, values)
    @id = adoption_data.first()['id'].to_i
  end


  def delete()
    sql = "DELETE FROM adopted_animals WHERE id = $1"
    values = [@id]
    adoption_to_remove = SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE adopted_animals
    SET
    (
      animal_id,
      owner_id,
      adoption_date
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@animal_id, @owner_id, @adoption_date, @id]
    SqlRunner.run( sql, values )
  end

  def find_animal()
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [@animal_id]
    animal = SqlRunner.run(sql, values)
    result = Animal.new(animal.first())
    return result
  end

  def find_owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    owner = SqlRunner.run(sql, values)
    result = Owner.new(owner.first())
    return result
  end

  #CLASS METHODS

  def self.all()
    sql = "SELECT * FROM adopted_animals"
    adoptions = SqlRunner.run( sql )
    result = adoptions.map { |adoption| Adopted_animal.new( adoption ) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM adopted_animals"
    SqlRunner.run( sql )
  end
end
