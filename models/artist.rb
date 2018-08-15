require('pg')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
  end

  def find_by_name
  end

  def find_by_album_title
  end

  def update
  end

  def delete_by_name
  end

  def Artist.all
  end

  def Artist.delete_all
  end

end
