class Board
  attr_reader :rows, :columns
  def initialize
    @rows = [0, 1, 2, 3, 4, 5, 6, 7]
    @columns = [0, 1, 2, 3, 4, 5, 6, 7]
  end
end

class Knight
  attr_reader :location
  def initialize
    @location = Array.new(2)
  end

  protected
  attr_accessor :location
end
