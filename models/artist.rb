require('pg')
require_relative('album.rb')
require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1) RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def find_albums
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    returned_array = SqlRunner.run(sql, values)
    return returned_array.map {|title| Album.new(title)}
  end

  def update
    sql = "UPDATE artists SET name
    = $1
    WHERE id = $2"
    values = [@name, @id]
    returned_array = SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Artist.all
    sql = "SELECT * FROM artists"
    returned_array = SqlRunner.run(sql)
    return returned_array.map {|artist| Artist.new(artist)}
  end

  def Artist.find_by_name(name)
    sql = "SELECT * FROM artists
    WHERE name = $1"
    values = [name]
    returned_array = SqlRunner.run(sql, values)
    returned_array.count > 0 ? returned_array.map {|artist| Artist.new(artist)} : nil
  end

  def Artist.find_by_id(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    returned_array = SqlRunner.run(sql, values)
    returned_array.count > 0 ? returned_array.map {|artist| Artist.new(artist)} : nil
  end

  def Artist.delete_all
    sql = "DELETE FROM artists"
    returned_array = SqlRunner.run(sql)
  end

end
