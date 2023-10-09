require_relative './assets.rb'

def knight_moves(location, destination)
  knight = Knight.new(location, destination)
  puts "You made it in #{knight.move_counter} moves! Here's your path:"
  knight.path_printer
end
