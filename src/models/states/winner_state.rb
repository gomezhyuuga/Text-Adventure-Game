class WinnerState
  def status
    output = ""

    output << "You won!! you have scaped with life from the castle!!! "
    output << "WELL DONE!!"
  end
  def initialize(game)
    @game = game
  end

  def handle
    self.status
  end
end
