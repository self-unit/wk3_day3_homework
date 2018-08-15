require('pg')
require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album
  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i if options['artist_id']
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO albums
    (title, genre, artist_id)
    VALUES
    ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def find_artist
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    returned_array = SqlRunner.run(sql, values)
    return returned_array.map {|artist| Artist.new(artist)}
  end

  def update
    sql = "UPDATE albums SET (title, genre, artist_id)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @genre, @artist_id, @id]
    returned_array = SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM albums
    WHERE id = $1"
    values = [@id]
    returned_array = SqlRunner.run(sql, values)
  end

  def Album.all
    sql = "SELECT * FROM albums"
    returned_array = SqlRunner.run(sql)
    return returned_array.map {|album| Album.new(album)}
  end

  def Album.find_by_title(title)
    sql = "SELECT * FROM albums
    WHERE title = $1"
    values = [title]
    returned_array = SqlRunner.run(sql, values)
    returned_array.count > 0 ? returned_array.map {|album| Album.new(album)} : nil
  end

  def Album.find_by_id(id)
    sql = "SELECT * FROM albums
    WHERE id = $1"
    values = [id]
    returned_array = SqlRunner.run(sql, values)
    returned_array.count > 0 ? returned_array.map {|album| Album.new(album)} : nil
  end

  def Album.delete_all
    sql = "DELETE FROM albums"
    returned_array = SqlRunner.run(sql)
  end

end
