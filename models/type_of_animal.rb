require_relative("../db/sql_runner")

class Type_of_animal

  attr_reader(:name, :id)

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

  def self.all()
    sql = "SELECT * FROM types_of_animals"
    types = SqlRunner.run( sql )
    result = types.map { |type| Type_of_animal.new( type ) }
    return result
  end


end
