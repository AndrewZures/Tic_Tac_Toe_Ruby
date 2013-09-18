require_relative '../../../src/ruby_ttt/console/console_game'
require_relative '../../../src/ruby_ttt/console/board_printer_factory'
require_relative '../../../src/ruby_ttt/console/console_ui'
require_relative '../../../src/ruby_ttt/core/factory'
require_relative '../../../src/ruby_ttt/core/game'

describe ConsoleGame do

  let(:io) { StringIO.new }
  let(:console) {ConsoleUI.new io}
  let(:factory){Factory.new}
  let(:console_game) { ConsoleGame.new console, factory, BoardPrinterFactory.new}
  let(:test_board_printer){BoardPrinterTwoDim.new}

  #it 'should build core game' do
  #  console.stub(:query_user_for_player_for_player_type).and_return("human", "human")
  #  console.stub(:query_user_for_board_type){"three_by_three"}
  #  console_game.build_game.should be_an_instance_of Game
  #end
  #
  #it 'asks human for move' do
  #  console.stub(:query_user_for_choice).and_return("human", "human")
  #  test_board_printer.stub(:print){}
  #  core_game.stub_chain(:board, :get_prints_results){}
  #  result =console_game.get_human_player_move(core_game, test_board_printer)
  #  result.should == 1
  #end


end