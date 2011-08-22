require_relative 'gamecore.rb'

class Player
	def initialize
		@images = Image.load('images/player1.png')
	end

	def draw(x, y, jun)
			Window.draw(x.to_i, y.to_i, @images, jun)
	end
end
