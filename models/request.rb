require_relative("../db/sql_runner")

class Request

  attr_accessor(:user_id, :animal_id, :comment)

  def initialize(options)
    @id = options["id"].to_i
    @user_id = options["user_id"].to_i
    @animal_id = options["animal_id"].to_i
    @comment = options["comment"]
  end

  def save()
  sql = "INSERT INTO requests
  (
    user_id,
    animal_id,
    comment
  )
  VALUES
  (
    $1, $2, $3
  )
  RETURNING *"
  values = [@user_id, @animal_id, @comment]
  request_data = SqlRunner.run(sql, values)
  @id = request_data.first()['id'].to_i
end


  def delete()
    sql = "DELETE FROM requests WHERE id = $1"
    values = [@id]
    request_to_remove = SqlRunner.run(sql, values)
  end

  def update()
  sql = "UPDATE requests SET ( user_id, animal_id, comment) = ($1, $2, $3) WHERE id = $4"
  values = [@user_id, @animal_id, @comment, @id]
  SqlRunner.run( sql, values )
  end

  def find_animal()
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [@animal_id]
    animal = SqlRunner.run(sql, values)
    result = Animal.new(animal.first())
    return result
  end

  def find_user()
    sql = "SELECT * FROM users WHERE id = $1"
    values = [@user_id]
    user = SqlRunner.run(sql, values)
    result = User.new(user.first())
    return result
  end

  #CLASS METHODS

    def self.all()
      sql = "SELECT * FROM requests"
      requests = SqlRunner.run( sql )
      result = requests.map { |request| Request.new( request ) }
      return result
    end

    def self.delete_all
    sql = "DELETE FROM requests"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM requests WHERE id = $1"
    values = [id]
    request = SqlRunner.run( sql, values )
    result = Request.new( request.first )
    return result
  end

end
