
class Song
   @@total_songs = 0

   def initialize
     @@total_songs += 1
   end

   def Song.total
    @@total_songs
  end
end

