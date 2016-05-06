# Final Project: A Text Adventure Game
# Date: 05-May-2016
# Authors: A01020319 Fernando Gomez Herrera
#          A01371743 Luis Eduardo Ballinas Aguilar

require_relative "states/exploring_state"

# +Game+ class instances represents games currently playing.
# It uses the StatePattern to save the state of the current game
# and what is doing the player. It also stores the game progress by
# remembering which rooms the player has visited.
class Game
  # Player associated to a game
  attr_accessor :player
  # The room that the player is currently exploring
  attr_accessor :current_room
  # Current game state. This can be either:
  # - ExploringState
  # - FightingState
  # - BuyingState
  # - LostState
  # - WinnerState
  attr_accessor :state

  # Status of the rooms in this game
  # e.g. rooms_status
  #   rooms_status = {
  #     "Hallway": #{ :monster, :treasure }
  #     ...
  #   }
  # If the key +room_name+ is present, means that you have already visited the room
  # and either killed a monster or picked-up a treasure inside the room.
  # If the keyword :monster or :treasure is inside the value of the key, it means
  # that you have killed the monster and/or picked-up the treasure.
  attr_accessor :rooms_status

  # Game initializar. Receives a +player+ as parameter and associates it a game.
  def initialize(player)
    @player       = player
    @current_room = "Entrance"
    @state        = ExploringState.new self
    @rooms_status = Hash.new
  end
 #to String method that shows the player name, the current room and the state.
  def to_s
    "Player: #{player.name} \nCurrent Room: #{@current_room} \nState: #{@state}"
  end

  # Returns the +Sequel::Model+ object for the current room
  def current_room_model
    Room[self.current_room]
  end

  # Checks if there is any game left in the room
  def monster_inside?
    not (@rooms_status[@current_room] && @rooms_status[@current_room].include?(:monster))
  end
  # Checks if there is any treasure left in the room
  def treasure_inside?
    not (@rooms_status[@current_room] && @rooms_status[@current_room].include?(:treasure))
  end
end
