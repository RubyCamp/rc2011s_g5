# -*- coding: sjis -*-
require_relative 'sound2.rb'

class Map
	attr_accessor :table_x
	attr_accessor :table_y
	attr_accessor :ivent
	attr_accessor :ivent_m
	def initialize
		@table_x = %w(723 922 1019 872 975 1073 1158 1139 963 1043 902 789 744 696 595 593 478 485 368 343 201 83 65 92 40 202 307 393 445)
		@table_y = %w(22 7 103 215 271 310 381 452 571 412 303 509 384 283 305 442 467 350 333 426 352 592 462 353 195 132 122 131 32)
		@ivent = %w(0 0 0 -3 1 0 -1 0 1 0 0 4 0 0 -14 0 -1 0 1 0 0 0 -1 0 0 0 0 -27 0)
		@ivent_m = ["", "", "", "日御碕で気分リフレッシュ！スタートに戻る。", "ゴビィに出会う。１マス進む！", "", "ハチに刺された！！１マス戻る。", "", "おろちループで１マス進む！", "", "", "からだが勝手に！？４マス進む！", "", "", "焼き物中にやけど。スタートに戻る。", "", "坂から落ちた。１マス戻る。", "", "白イルカに乗って１マス進む！", "", "", "", "おみくじで凶がでた。１マス戻る。" , "", "", "", "", "体調が悪くなった。スタートに戻る。", "ゴール"]
		@end_image =[Image.load('images/end.bmp'), Image.load('images/end2.bmp'), Image.load('images/end3.bmp')]
		@images = Image.load('images/map.bmp')
		@font = Font.new(32)
		@sound = Kkk.new
		@anim_count = 0
		@sound_flg = 0
		@count = 0
		@x = 275
		@y = 140
	end

	def draw
		Window.drawScale(@x, @y, @images, 1.7, 1.7)
	end
	
	def draw_m(string)
		if string == ""
		else
			Window.drawFont(1100, 650, "Enterキー  →", @font, :color => [0,0,0])
		end
		Window.drawFont(425, 650, string, @font, :color => [0,0,0])
	end

	def end_draw
		if @sound_flg == 0
			@sound.start
			@sound_flg = 1
		end
			Window.bgcolor = [255, 255, 255]
			if @anim_count >= 0 and 33 >= @anim_count
				Window.drawScale(550, 0, @end_image[0], 0.6, 0.6)
			elsif @anim_count >= 34 and 66 >= @anim_count
				Window.drawScale(520, 0, @end_image[1], 0.6, 0.6)
			elsif @anim_count >= 67 and 100 >= @anim_count
				Window.drawScale(360, -109, @end_image[2], 0.6, 0.6)
            elsif @anim_count > 100
              @anim_count = 0
			end		
			@anim_count += 1
			Window.drawFont(1100, 650, "Escキーで終了　", @font, :color => [0,0,0])
	end
end
