require_relative '../core/ruby_ttt_spec_helper'

describe ConsoleUI do

  let(:io) { StringIO.new }
  let(:console) { ConsoleUI.new io }

  it 'creates new ui console' do
    console.should be_an_instance_of ConsoleUI
  end

  describe '#receive_user_choice' do

    it 'receives user choice and sanitizes input' do
      console.stub(:gets) { "1" }
      console.receive_user_choice.should == "1"

      console.stub(:gets) { "Y" }
      console.receive_user_choice.should == "y"
    end
  end

  describe '#query_user_for_choice' do

    it 'receives input from user once at a time' do
      player = 1
      console.stub(:receive_user_choice) { 1 }
      console.query_user_for_choice(player).should eql(1)
    end

    it 'queries for user input - player1' do
      player = 1
      console.stub(:receive_user_choice) { 1 }
      console.query_user_for_choice(player)
      io.string.should match 'User 1: Choose'
    end

    it 'queries for user input - player2' do

      player = -1
      console.stub(:receive_user_choice) { 1 }
      console.query_user_for_choice(player)
      io.string.should match 'User -1: Choose'
    end
  end

  describe '#query_user_for_choice' do

    it 'asks user for new game' do
      console.stub(:receive_user_choice) { 1 }
      console.query_user_for_new_game
      io.string.should match 'Would you like to start another game?'
    end

    it "returns true if user inputs 'y'" do
      console.stub(:receive_user_choice) { "y" }
      console.query_user_for_new_game.should == true
    end
  end

  describe '#respond_to_choice' do

    it 'tells user that invalid choice is invalid' do
      choice = 1
      console.respond_to_choice(false, choice)
      io.string.should match "Whoops! That choice wasn't valid"

    end

    it 'tells user if choice was valid (choice = 1)' do
      choice = 1
      console.respond_to_choice(true, choice)
      io.string.should match 'You Chose: 1'
    end

    it 'tells user if choice was valid (choice = 9)' do
      choice = 9
      console.respond_to_choice(true, choice)
      io.string.should match 'You Chose: 9'
    end
  end

  describe '#present_game_result' do

    it 'presents tie text to user if result is tie' do
      console.present_game_result(:tie)
      io.string.should match 'Game Over: Tie'
    end

    it 'sends player 1 win to console' do
      console.present_game_result(:x)
      io.string.should match 'Player x Wins'
    end

    it 'sends player -1 win to console' do
      console.present_game_result(:o)
      io.string.should match 'Player o Wins'
    end
  end

end
