## +WinnerState+ class
class WinnerState
  # Initializer for WinnerState
  def initialize(game)
    @game = game
  end
  # Current status for a winning state
  def status
    output = ""
    player = @game.player
    output << "You won!! you have scaped with life from the castle!!! "
    output << "WELL DONE!!"
  end

  # Handle the event when transition is on a winning state
  def handle
    self.status
    output << "Your final score is => #{player.score}\n"
  end
end
