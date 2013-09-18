require_relative 'ruby_ttt/core/factory'
require_relative 'ruby_ttt/console/console_ui'
require_relative 'ruby_ttt/console/console_game'
require_relative 'ruby_ttt/console/board_printer_factory'

p 'starting ruby tic tac toe...'

console = ConsoleUI.new
factory = Factory.new
board_printer_factory = BoardPrinterFactory.new
game = ConsoleGame.new(console, factory, board_printer_factory)
game.play
