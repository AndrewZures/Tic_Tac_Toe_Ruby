require_relative '../core/factory'
require_relative 'console_ui'
require_relative 'console_game'
require_relative 'board_printer_factory'

console = ConsoleUI.new
factory = Factory.new
board_printer_factory = BoardPrinterFactory.new
game = ConsoleGame.new(console, factory, board_printer_factory)
game.play