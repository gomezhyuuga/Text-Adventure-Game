require_relative "states/exploring_state"
class Game
  attr_accessor :player, :current_room, :state

  # e.g. rooms_status
  #   rooms_status = {
  #     "Hallway": #{ :monster, :treasure }
  #     ...
  #   }
  # If the key +room_name+ is present, means that you have already visited the room
  # and either killed a monster or picked-up a treasure inside the room.
  # If the keyword :monster or :treasure is inside the value of the key, it means
  # that you have killed the monster and/or picked-up the treasure.
  def initialize(player)
    @player = player
    @current_room = "Entrance"
    @state = ExploringState.new self
  end

  def to_s
    "Player: #{player.name} \nCurrent Room: #{@current_room} \nState: #{@state}"
  end

  # Returns the +Sequel::Model+ object for the current room
  def current_room_model
    Room[self.current_room]
  end
end
