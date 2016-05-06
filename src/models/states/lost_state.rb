class LostState

  def status
    output = ""

    output << "You are dead!!!"
    output << "Game Over"
  end
  def initialize(game)
    @game = game
  end
  def handle
    self.status
  end
end
