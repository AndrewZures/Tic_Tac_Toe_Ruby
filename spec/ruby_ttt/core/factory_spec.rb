require_relative './ruby_ttt_spec_helper'

describe Factory do

  let(:factory) { Factory.new }

  describe 'get_board' do

    it 'returns a 3x3 board' do
      board = factory.get_board("three_by_three")
      board.should be_an_instance_of TwoDimensionalBoard
      board.row_length.should == 3
    end

    it 'returns a 4x4 board' do
      board = factory.get_board("four_by_four")
      board.should be_an_instance_of TwoDimensionalBoard
      board.row_length.should == 4
    end

    it 'returns a 5x5 board' do
      board = factory.get_board("five_by_five")
      board.should be_an_instance_of TwoDimensionalBoard
      board.row_length.should == 5
    end

    it 'returns a 3x3x3 board' do
      board = factory.get_board("cube_three")
      board.should be_an_instance_of ThreeDimensionalBoard
      board.row_length.should == 3
    end

    it 'returns unknown board type error' do
      expect{factory.get_board("bad_type")}.to raise_error("unknown board type")
    end

  end

  describe 'get_player' do

    it 'returns a human player' do
      player = factory.get_player("human", :x, :o, "player1")
      player.should be_an_instance_of HumanPlayer
    end

    it 'returns an easy ai player' do
      player = factory.get_player("easy_ai", :x, :o, "player1")
      player.should be_an_instance_of ComputerAI
      player.threshold.should == 10
    end

    it 'returns a medium ai player' do
      player = factory.get_player("medium_ai", :x, :o, "player1")
      player.should be_an_instance_of ComputerAI
      player.threshold.should == 50
    end

    it 'returns an unbeatable ai player' do
      player = factory.get_player("unbeatable_ai", :x, :o, "player1")
      player.should be_an_instance_of ComputerAI
      player.threshold.should == 100
    end

    it 'returns unknown player type warning' do
      expect{factory.get_player("bad_type", :x, :o, "player1")}.to raise_error("unknown player type")
    end
  end

end
