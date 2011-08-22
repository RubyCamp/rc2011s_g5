require 'dxruby'
require_relative 'gamecore.rb'
require_relative 'sound.rb'

Window.caption = "RubyCamp2010 Example"
Window.width = 1350
Window.height = 700
@game = Gamecore.new
@sound = Bgm.new

@sound.start_bgm
flg = 0
image = Image.load('images/top2.bmp')
Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	if flg == 0
		Window.drawScale(275, 126, image, 1.7, 1.7)
	else
		@game.play
	end
	if Input.keyPush?( K_RETURN )
		flg = 1
		@sound.stop_bgm
	end
end