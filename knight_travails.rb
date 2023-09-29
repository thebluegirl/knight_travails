class Board
  attr_reader :squares
  def initialize
    @rows = [0, 1, 2, 3, 4, 5, 6, 7]
    @columns = [0, 1, 2, 3, 4, 5, 6, 7]
    @squares = squares_builder(@rows, @columns)
  end

  def squares_builder(arr1, arr2)
    squares = Array.new
    arr1.each do |row|
      arr2.each do |column|
        coordinates = []
        coordinates << row
        coordinates << column
        squares << coordinates
      end
    end
    return squares
  end

  protected
  attr_accessor :row, :columns
end

class Knight
  attr_reader :location
  def initialize
    @location = Array.new(2)
  end

  protected
  attr_accessor :location
end
