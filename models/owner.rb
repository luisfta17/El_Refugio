require_relative("../db/sql_runner")

class Owner

  attr_accessor(:name, :contact_details, :id)

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @contact_details = options["contact_details"]
  end

  def save()
  sql = "INSERT INTO owners
  (
    name,
    contact_details
  )
  VALUES
  (
    $1, $2
  )
  RETURNING *"
  values = [@name, @contact_details]
  owner_data = SqlRunner.run(sql, values)
  @id = owner_data.first()['id'].to_i
end


  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    owner_to_remove = SqlRunner.run(sql, values)
  end

  def update()
  sql = "UPDATE owners SET ( name, contact_details) = ($1, $2) WHERE id = $3"
  values = [@name, @contact_details, @id]
  SqlRunner.run( sql, values )
end

  def self.all()
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run( sql )
    result = owners.map { |owner| Owner.new( owner ) }
    return result
  end


end
