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
        coordinates = Vertex.new(coordinates)
        squares << coordinates
      end
    end
    return squares
  end

  protected
  attr_accessor :row, :columns
end

class Knight
  attr_reader :location, :location_on_board, :destination, :destination_on_board
  def initialize(location, destination)
    @board = Board.new
    @location = location
    @location_on_board = locate_on_board(location)
    @destination = destination
    @destination_on_board = locate_on_board(destination)
  end

  def locate_on_board(coordinates)
    @board.squares.each do |square|
      return square if square.square == coordinates
    end
  end

  def move_count(counter=0)
    return counter if @location == @destination
  end

  protected 
  attr_accessor :board
end

class Vertex
  def initialize(square)
    @square = square
    @possible_moves = possible_moves_finder(@square)
  end

  def possible_moves_finder(square)
    possible_moves = Array.new
    find_array = 
      [[1, 2], [2, 1], [-1, -2], [-2, -1], [-1, 2], [-2, 1], [2, -1], [1, -2]]
    find_array.each do |coordinates|
      possible_move = [(square[0] + coordinates[0]), (square[1] + coordinates[1])]
      possible_moves << possible_move if move_possible?(possible_move)
    end
    return possible_moves
  end

  def move_possible?(array)
    array.each do |value|
      return false if value < 0
    end
    return true
  end

  public
  attr_reader :square, :possible_moves
end
