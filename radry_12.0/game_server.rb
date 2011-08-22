# encoding: Shift_JIS

#require 'dxruby'
require 'drb/drb'
require_relative './svr_player'

class GameServer
  @MAX_PLAYER=2
  #このインスタンスの初期化
  
  def initialize
    @turn=0
  end

  #Plyaerを追加し初期化
  def add_player name 
    if !@player1
      @player1 = Player.new(name)
      puts "called add p1"
    elsif !@player2
     @player2 = Player.new(name)
     puts "called add p2"
    end
  end
  
  
  #playerをアップデート
  def update_player(dice)
    #puts "called update_player()"
    self.add_turn
    if @turn%2 == 1
      puts "call p1 update"
      @player1.player_move(dice)
      return @player1.position
    else
      puts "call p2 update" 
      @player2.player_move(dice)
      return @player2.position
    end
    
  end
  
  def add_turn
    @turn+=1
  end
  
#  def get_player
#  end

end

uri ='druby://127.0.0.1:3000'
DRb.start_service(uri,GameServer.new)
puts "started server."
sleep
