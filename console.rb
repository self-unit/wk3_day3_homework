require('pry-byebug')
require_relative('/models/album.rb')
require_relative('/models/artist.rb')
require_relative('../db/sql_runner.sql')

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({
  'name' => 'Jennifer Lopez'
  })

  artist2 = Artist.new({
    'name' => 'Michael Jackson'
    })

    artist3 = Artist.new({
      'name' => 'Bjørk'
      })

      artist4 = Artist.new({
        'name' => 'Autechre'
        })

artist1.save()
artist2.save()
artist3.save()
artist4.save()

album1 = Album.new({
  'title' => 'Off the Wall'
  'genre' => 'Funk/Soul'
  'artist_id' => '2'
  })

  album2 = Album.new({
    'title' => 'This is me now'
    'genre' => 'R&B'
    'artist_id' => '1'
    })

    album3 = Album.new({
      'title' => 'Dangerous'
      'genre' => 'New Jack Swing'
      'artist_id' => '2'
      })

      album4 = Album.new({
        'title' => 'Move of 10'
        'genre' => 'IDM'
        'artist_id' => '4'
        })

        album5 = Album.new({
          'title' => 'Homogenic'
          'genre' => 'Electronica'
          'artist_id' => '3'
          })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()

binding.pry
nil
