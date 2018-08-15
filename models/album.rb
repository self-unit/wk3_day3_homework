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

    def find_by_title
    end

    def find_artist_by_title
    end

    def update
    end

    def delete_by_title
    end

    def Album.all
      sql = "SELECT * FROM albums"
      returned_array = SqlRunner.run(sql)
      return returned_array.map {|title| Album.new(title)}
    end

    def Album.delete_all
      sql = "DELETE FROM albums"
      returned_array = SqlRunner.run(sql)
    end

end
