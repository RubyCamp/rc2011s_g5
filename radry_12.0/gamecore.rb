# -*- coding: sjis -*-

require 'dxruby'
require_relative 'dice.rb'
require_relative 'map.rb'
require_relative 'player.rb'
require_relative 'sound.rb'

class Gamecore
	def initialize
		@strings = ""
		@jun = 1
		@flg = 0
		@flg2 = 0
		@end_flg = 0
		@count = 0
		@dice = Dice.new(1138, 48)
		@map = Map.new
		@player = Player.new
		@sound = Bgm.new
		@sound_flg = 0
	end
	
	def play
		#if Input.mousePush?( M_LBUTTON )
			#p Input.mousePosX 
			#p Input.mousePosY
			#exec("notepad")
		#end

		if @count == 28
			@end_flg = 1
			@sound.stop_bgm2
		end
		
		if @sound_flg == 0
			@sound.start_bgm2
			@sound_flg = 1
		end
			
		if Input.keyPush?( K_RETURN ) and @flg2 == 0
			@dice.shoot
			@sound.start_bgm_dice_yo
			@flg = 1
		end

		if @flg == 1
			all_draw
			@sound.start_bgm_dice_pon
		end
		
		if Input.keyPush?( K_SPACE ) and @flg == 1 and @flg2 == 0
			@sound.start_bgm_dice_pon
			@flg = 0 
			@kyori = @dice.num + 1
			@kyori.times do
				@count = @count + 1
				if @count > 28
					@count = @count % 29
				end
				@jun
				all_draw
				@jun += 1
			end
			#p @count
			@strings = @map.ivent_m[@count]
			if @strings == ""
			else 
				@flg2 = 1
			end
			@jun =1
		end
		#p Input.mousePosX 
		#p Input.mousePosY
		if Input.keyPush?( K_RETURN ) and @flg == 0
			@count = @map.ivent[@count].to_i + @count
			@flg2 = 0
		end
		all_draw
		
	end

	def all_draw
		if @end_flg == 0
			@map.draw
			@map.draw_m(@strings)
			@dice.draw(@flg)
			@player.draw(@map.table_x[@count], @map.table_y[@count], @jun)
		elsif @end_flg == 1
			@map.end_draw
		end	
	end
end
		