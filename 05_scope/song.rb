$hello = "hello"

class Song
	attr_accessor :title
   @@total_songs = 0

   def Song.new(arg1, arg2)
   	super("Song Name")
   end

   def initialize(title)
   	@title = title
     @@total_songs += 1
   end

   def Song.total
   	puts self
   	@total = 42
    @@total_songs
   end

   def Song.tot
   	@total
   end

   def total
   	puts @total
   	puts self
   		@@total_songs
   end
end


