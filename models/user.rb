require_relative("../db/sql_runner")

class User

  attr_accessor(:name, :contact_details, :id)

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @contact_details = options["contact_details"]
  end

  def save()
  sql = "INSERT INTO users
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
  user_data = SqlRunner.run(sql, values)
  @id = user_data.first()['id'].to_i
end


  def delete()
    sql = "DELETE FROM users WHERE id = $1"
    values = [@id]
    user_to_remove = SqlRunner.run(sql, values)
  end

  def update()
  sql = "UPDATE users SET ( name, contact_details) = ($1, $2) WHERE id = $3"
  values = [@name, @contact_details, @id]
  SqlRunner.run( sql, values )
  end

  #CLASS METHODS

    def self.all()
      sql = "SELECT * FROM users"
      users = SqlRunner.run( sql )
      result = users.map { |user| User.new( user ) }
      return result
    end

    def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    user = SqlRunner.run( sql, values )
    result = User.new( user.first )
    return result
  end

end
