# encoding: Shift_JIS

class Player
  attr_accessor :player_turn
  attr_accessor :position
  attr_accessor :dice
  attr_accessor :player_name
  
  def initialize(name)
    self.player_name= name
    self.position=1
    self.player_turn=1
  #  move(1)
  end

  def player_move(position)
    puts "call move"
    self.position = self.position+position
    self.player_turn = self.player_turn+1
  end
  
end