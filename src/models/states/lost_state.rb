## +LostState+ class
class LostState
  # Initializer for LostState
  def initialize(game)
    @game = game
  end

  # Status for a losing state
  def status
    output = ""

    output << "You are dead!!!"
    output << "Game Over"
  end
  # Handles the event when the player lose
  def handle
    self.status
  end
end
