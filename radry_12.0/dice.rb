require 'securerandom'

class Dice
	attr_accessor :num
	def initialize(x, y)
		@x = x
		@y = y
		@images = [Image.load('images/d1.png'),
                   Image.load('images/d2.png'),
                   Image.load('images/d3.png'),
                   Image.load('images/d4.png'),
                   Image.load('images/d5.png'),
                   Image.load('images/d6.png')]
		@num = 0
	end

	def shoot
		@num = rand(6)
		#@num = 27
	end

	def draw(x)
		if x == 1
			shoot
			Window.draw(@x, @y, @images[@num])
			#Window.draw(@x, @y, @images[1])
		else
			Window.draw(@x, @y, @images[@num])
			#Window.draw(@x, @y, @images[1])
		end
	end
end
