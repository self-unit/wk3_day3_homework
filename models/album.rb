require('pg')

class Album
  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i
    @artist_id = options['artist_id'].to_i if options['artist_id']
  end

    def save
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
    end

    def Album.delete_all
    end

end
