require_relative("../db/sql_runner")

class Type_of_animal

  attr_accessor(:name, :id)

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO types_of_animals
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM types_of_animals WHERE id = $1"
    values = [@id]
    type_to_remove = SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE types_of_animals SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  # CLASS METHODS
  def self.all()
    sql = "SELECT * FROM types_of_animals"
    types = SqlRunner.run( sql )
    result = types.map { |type| Type_of_animal.new( type ) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM types_of_animals"
    SqlRunner.run( sql )
  end

  def self.find_animals_by_type_id(id)
    sql = "SELECT * FROM animals WHERE type_id = $1"
    values = [id]
    animal_data = SqlRunner.run(sql, values)
    result = animal_data.map { |animal| Animal.new( animal ) }
    return result
  end
end
