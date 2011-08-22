require 'dxruby'

class Bgm
	def initialize
		@bgm = Sound.new("sound/start.mid")
		@bgm2 = Sound.new("sound/game.mid")
		@bgm_dice_yo = Sound.new("sound/yo.wav")
		@bgm_dice_pon = Sound.new("sound/dice.wav")
		@bgm.setVolume(230)
		@bgm2.setVolume(200)
		@bgm_dice_pon.setVolume(200)
		@bgm_dice_yo.setVolume(200)
	end

	def start_bgm
		@bgm.play
	end

	def stop_bgm
		@bgm.stop
	end

	def start_bgm2
		@bgm2.play
	end

	def stop_bgm2
		@bgm2.stop
	end

	def start_bgm_dice_yo
		@bgm_dice_yo.play
	end

	def stop_bgm_dice_yo
		@bgm_dice_yo.stop
	end

	def start_bgm_dice_pon
		@bgm_dice_pon.play
	end

	def stop_bgm_dice_pon
		@bgm_dice_pon.stop
	end

	def start_bgm_dice_pon2
		@bgm_dice_pon2.start
	end

	def stop_bgm_dice_pon2
		@bgm_dice_pon2.stop
	end
end